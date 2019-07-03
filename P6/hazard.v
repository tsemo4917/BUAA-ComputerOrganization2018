`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:33 11/24/2018 
// Design Name: 
// Module Name:    hazard 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hazard(
    input [31:0] instr_D,
    input [31:0] instr_E,
    input [31:0] instr_M,
    input Busy,
    input Start,
    input RegWrite_W,
    input [4:0] WriteAddr_W,
    // output
    output [1:0]rs_Dforward,
	output [1:0]rt_Dforward,
	output [2:0]rs_Eforward,
	output [2:0]rt_Eforward,
	output [2:0]rt_Mforward,

	output IR_E_clear,
	output IR_D_EN,
	output PC_EN
    );
	`define rs 25:21
    `define rt 20:16
    `define rd 15:11
    `define ra 5'b11111

    wire[4:0] rs_D, rt_D;
	wire[4:0] rs_E, rt_E, rd_E;
	wire[4:0] rt_M, rd_M;
//	wire[4:0] rt_W, rd_W;
	assign rs_D = instr_D[`rs];
	assign rt_D = instr_D[`rt];
	
	assign rs_E = instr_E[`rs];
	assign rt_E = instr_E[`rt];
	assign rd_E = instr_E[`rd];
	
	assign rt_M = instr_M[`rt];
	assign rd_M = instr_M[`rd];
	    
    wire Cal_r_D, Cal_i_D, branch_D, load_D, store_D, jr_D, jalr_D, mtHILO_D, mfHILO_D, mulDiv_D;
    InstrType instr_D_type(
        .instr(instr_D),
        // output
        .Cal_r(Cal_r_D),
        .Cal_i(Cal_i_D),
        .branch(branch_D),
        .load(load_D),
        .store(store_D),
        .jr(jr_D),
        .jalr(jalr_D),
        .mtHILO(mtHILO_D),
        .mfHILO(mfHILO_D),
        .mulDiv(mulDiv_D)
    );
    
    wire Cal_r_E, Cal_i_E, branch_E, load_E, store_E, jr_E, linkRa_E, jalr_E, mtHILO_E, mfHILO_E, mulDiv_E;
    InstrType instr_E_type(
        .instr(instr_E),
        // output
        .Cal_r(Cal_r_E),
        .Cal_i(Cal_i_E),
        .branch(branch_E),
        .load(load_E),
        .store(store_E),
        .jr(jr_E),
        .linkRa(linkRa_E),
        .jalr(jalr_E),
        .mtHILO(mtHILO_E),
        .mfHILO(mfHILO_E)
    );
    
    wire Cal_r_M, Cal_i_M, branch_M, load_M, store_M, jr_M, linkRa_M, jalr_M, mtHILO_M, mfHILO_M, mulDiv_M;
    InstrType instr_M_type(
        .instr(instr_M),
        // output
        .Cal_r(Cal_r_M),
        .Cal_i(Cal_i_M),
        .branch(branch_M),
        .load(load_M),
        .store(store_M),
        .jr(jr_M),
        .linkRa(linkRa_M),
        .jalr(jalr_M),
        .mtHILO(mtHILO_M),
        .mfHILO(mfHILO_M)
    );


    /****************** stall *****************/
    assign rs_use0 = branch_D || jr_D || jalr_D;
    assign rs_use1 = Cal_r_D || Cal_i_D || load_D || store_D || mtHILO_D;
    assign rt_use0 = branch_D || jr_D || jalr_D;
    assign rt_use1 = Cal_r_D;

    assign rd_new1_E = Cal_r_E || mfHILO_E;
    assign rt_new1_E = Cal_i_E;
    assign rt_new2_E = load_E;
    assign rt_new1_M = load_M;

    // stall = Tuse < Tnew
    assign stall_rs =   (rs_D != 5'b0) && (
                            // rs1
                            (rs_use1 && rt_new2_E && rs_D == rt_E) ||
                            // rs0
                            (rs_use0 && rd_new1_E && rs_D == rd_E) ||
                            (rs_use0 && rt_new1_E && rs_D == rt_E) ||
                            (rs_use0 && rt_new2_E && rs_D == rt_E) ||
                            (rs_use0 && rt_new1_M && rs_D == rt_M)
                        );

    assign stall_rt =   (rt_D != 5'b0) && (
                            (rt_use1 && rt_new2_E && rt_D == rt_E) ||
                            (rt_use0 && rd_new1_E && rt_D == rd_E) ||
                            (rt_use0 && rt_new1_E && rt_D == rt_E) ||
                            (rt_use0 && rt_new2_E && rt_D == rt_E) ||
                            (rt_use0 && rt_new1_M && rt_D == rt_M)
                        );

    assign stall =      stall_rs || stall_rt || (mulDiv_D && (Busy || Start));

    // set output
	assign IR_E_clear =     stall;
    assign IR_D_EN =        ~stall;
	assign PC_EN =          ~stall;
    /****************** stall finish *****************/

    /****************** Forward *****************/
    // pipeline register Mpart
    assign AO_M_rd =        Cal_r_M;
    assign AO_M_rt =        Cal_i_M; 
    assign PC8_M_rd =       jalr_M;
    assign PC8_M_ra =       linkRa_M;
    assign HILO_M_rd =      mfHILO_M;

    assign Duse_rs =        branch_D || jr_D || jalr_D;
    assign Duse_rt =        branch_D;
    assign Euse_rs =        Cal_r_E || Cal_i_E || load_E || store_E || mtHILO_E;
    assign Euse_rt =        Cal_r_E || store_E;
    assign Muse_rt =        store_M;

    assign rs_Dforward = 
        (Duse_rs && rs_D != 0) && (
            (AO_M_rd && rs_D == rd_M) || (AO_M_rt && rs_D == rt_M)
        ) ? 2'b01 : // AO_M
        (Duse_rs && rs_D != 0) && (
            (PC8_M_rd && rs_D == rd_M) || (PC8_M_ra && rs_D == `ra) 
        ) ? 2'b10 : // PC_M + 8 
        (Duse_rs && rs_D != 0) && (
            (HILO_M_rd && rs_D == rd_M)
        ) ? 2'b11 : // HILO_M
            2'b00 ; // RD1

    assign rt_Dforward = 
        (Duse_rt && rt_D != 0) && (
            (AO_M_rd && rt_D == rd_M) || (AO_M_rt && rt_D == rt_M)
        ) ? 2'b01 : // AO_M
        (Duse_rt && rt_D != 0) && (
            (PC8_M_rd && rt_D == rd_M) || (PC8_M_ra && rt_D == `ra)
        ) ? 2'b10 : // PC_M + 8
        (Duse_rt && rt_D != 0) && (
            (HILO_M_rd && rt_D == rd_M)
        ) ? 2'b11 : // HILO_M
            2'b00 ; // RD2
    
    assign rs_Eforward = 
        (Euse_rs && rs_E != 0) && (
            (AO_M_rd && rs_E == rd_M) || (AO_M_rt && rs_E == rt_M) 
        ) ? 3'b001 :    // AO_M
        (Euse_rs && rs_E != 0) && (
            (PC8_M_rd && rs_E == rd_M) || (PC8_M_ra && rs_E == `ra) 
        ) ? 3'b010 :    // PC8_M
        (Euse_rs && rs_E != 0) && (
            (HILO_M_rd && rs_E == rd_M)
        ) ? 3'b011 :    // HILO_M
        (Euse_rs && rs_E != 0) && (
            (RegWrite_W && rs_E == WriteAddr_W)
        ) ? 3'b100 :    // Result_W                                     
            3'b000 ;
            
    assign rt_Eforward = 
        (Euse_rt && rt_E != 0) && (
            (AO_M_rd && rt_E == rd_M) || (AO_M_rt && rt_E == rt_M)
        ) ? 3'b001 :
        (Euse_rt && rt_E != 0) && (
            (PC8_M_rd && rt_E == rd_M) || (PC8_M_ra && rt_E == `ra)
        ) ? 3'b010 :
        (Euse_rt && rt_E != 0) && (
            (HILO_M_rd && rt_E == rd_M)
        ) ? 3'b011 :
        (Euse_rt && rt_E != 0) && (
            (RegWrite_W && rt_E == WriteAddr_W)
        ) ? 3'b100 :    // Result_W
            3'b000 ;
    
    assign rt_Mforward = 
        (Muse_rt && rt_M != 0) && (
            (RegWrite_W && rt_M == WriteAddr_W)
        ) ? 3'b001 :    // Result_W
            3'b000 ;    // RT_M
    
    
endmodule
