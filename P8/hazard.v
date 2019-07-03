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
    input [31:0]    instr_D,
    input [31:0]    instr_E,
    input [31:0]    instr_M,
    input [4:0]     WriteAddr_W,
    input           RegWrite_W,
    input           IntReq,
    // output
    output [1:0]    rs_Dforward,
	output [1:0]    rt_Dforward,
	output [1:0]    rs_Eforward,
	output [1:0]    rt_Eforward,
	output          rt_Mforward,
	output          IR_E_flush,
	output          IR_D_EN,
	output          PC_EN
    );
	`define rs  25:21
    `define rt  20:16
    `define rd  15:11
    `define ra  5'd31
    `define epc 5'd14

    wire[4:0] rs_D, rt_D;
	wire[4:0] rs_E, rt_E, rd_E;
	wire[4:0] rt_M, rd_M;
	assign rs_D = instr_D[`rs];
	assign rt_D = instr_D[`rt];
	
	assign rs_E = instr_E[`rs];
	assign rt_E = instr_E[`rt];
	assign rd_E = instr_E[`rd];
	
	assign rt_M = instr_M[`rt];
	assign rd_M = instr_M[`rd];
	   
//    wire Cal_r_D, Cal_i_D, branch_D, load_D, store_D, jr_D, jalr_D, eret_D;
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
        .eret(eret_D)
    );
    
//    wire Cal_r_E, Cal_i_E, branch_E, load_E, store_E, jr_E, linkRa_E, jalr_E, mfc0_E, mtc0_E;
    InstrType instr_E_type(
        .instr(instr_E),
        // output
        .Cal_r(Cal_r_E),
        .Cal_i(Cal_i_E),
//        .branch(branch_E),
        .load(load_E),
//        .store(store_E),
//        .jr(jr_E),
//        .linkRa(linkRa_E),
//        .jalr(jalr_E),
        .mfc0(mfc0_E),
        .mtc0(mtc0_E)
    );
    
//    wire Cal_r_M, Cal_i_M, branch_M, load_M, store_M, jr_M, linkRa_M, jalr_M, mfc0_M, mtc0_M;
    InstrType instr_M_type(
        .instr(instr_M),
        // output
        .Cal_r(Cal_r_M),
        .Cal_i(Cal_i_M),
//        .branch(branch_M),
        .load(load_M),
//        .store(store_M),
//        .jr(jr_M),
        .linkRa(linkRa_M),
        .jalr(jalr_M),
        .mfc0(mfc0_M),
        .mtc0(mtc0_M)
    );

    /****************** stall *****************/
    assign rs_use0 = branch_D || jr_D || jalr_D;
    assign rs_use1 = Cal_r_D || Cal_i_D || load_D || store_D;
    assign rt_use0 = branch_D;
    assign rt_use1 = Cal_r_D;

    assign rd_new1_E = Cal_r_E;
    assign rt_new1_E = Cal_i_E;
    assign rt_new2_E = load_E || mfc0_E;
    assign rt_new1_M = load_M || mfc0_M;

    // stall = Tuse < Tnew
    assign stall_rs =       (rs_D != 5'b0) && (
                                (rs_use1 && rt_new2_E && rs_D == rt_E) || 
                                (rs_use0 && rd_new1_E && rs_D == rd_E) || (rs_use0 && rt_new1_E && rs_D == rt_E) ||
                                (rs_use0 && rt_new2_E && rs_D == rt_E) || (rs_use0 && rt_new1_M && rs_D == rt_M)
                            );
    assign stall_rt =       (rt_D != 5'b0) && (
                                (rt_use1 && rt_new2_E && rt_D == rt_E) ||
                                (rt_use0 && rd_new1_E && rt_D == rd_E) || (rt_use0 && rt_new1_E && rt_D == rt_E) ||
                                (rt_use0 && rt_new2_E && rt_D == rt_E) || (rt_use0 && rt_new1_M && rt_D == rt_M)
                            );
                            
    assign stall_eret =     eret_D && ((mtc0_E && rd_E == `epc) || (mtc0_M && rd_M == `epc));

    assign stall =          !IntReq && (stall_rs || stall_rt || stall_eret);
    // set output
	assign IR_E_flush =     stall;
    assign IR_D_EN =        ~stall;
	assign PC_EN =          ~stall;
    /****************** stall finish *****************/

    /****************** Forward *****************/
    // W part Data forwarding use Detector method
    assign rs_Dforward =    rs_D != 0 && ((Cal_r_M && rs_D == rd_M) || (Cal_i_M && rs_D == rt_M)
                            ) ? 2'b01 :     // AO_M
                            rs_D != 0 && ((jalr_M && rs_D == rd_M) || (linkRa_M && rs_D == `ra)
                            ) ? 2'b10 :     // PC_M + 8 
                                2'b00 ;     // RD1

    assign rt_Dforward =    rt_D != 0 && ((Cal_r_M && rt_D == rd_M) || (Cal_i_M && rt_D == rt_M)
                            ) ? 2'b01 :     // AO_M
                            rt_D != 0 && ((jalr_M && rt_D == rd_M) || (linkRa_M && rt_D == `ra)
                            ) ? 2'b10 :     // PC_M + 8
                                2'b00 ;     // RD2
    
    assign rs_Eforward =    rs_E != 0 && ((Cal_r_M && rs_E == rd_M) || (Cal_i_M && rs_E == rt_M) 
                            ) ? 2'b01 :    // AO_M
                            rs_E != 0 && ((jalr_M && rs_E == rd_M) || (linkRa_M && rs_E == `ra) 
                            ) ? 2'b10 :    // PC8_M
                            rs_E != 0 && ((RegWrite_W && rs_E == WriteAddr_W)
                            ) ? 2'b11 :    // Result_W                                     
                                2'b00 ;
            
    assign rt_Eforward =    rt_E != 0 && ((Cal_r_M && rt_E == rd_M) || (Cal_i_M && rt_E == rt_M)
                            ) ? 2'b01 :
                            rt_E != 0 && ((jalr_M && rt_E == rd_M) || (linkRa_M && rt_E == `ra)
                            ) ? 2'b10 :
                            rt_E != 0 && ((RegWrite_W && rt_E == WriteAddr_W)
                            ) ? 2'b11 :    // Result_W
                                2'b00 ;
    
    assign rt_Mforward =    rt_M != 0 && (RegWrite_W && rt_M == WriteAddr_W); // Result_W

//    // pipeline register of M_part
//    assign AO_M_rd =        Cal_r_M;
//    assign AO_M_rt =        Cal_i_M; 
//    assign PC8_M_rd =       jalr_M;
//    assign PC8_M_ra =       linkRa_M;
//    assign Duse_rs =        branch_D || jr_D || jalr_D;
//    assign Duse_rt =        branch_D;
//    assign Euse_rs =        Cal_r_E || Cal_i_E || load_E || store_E;
//    assign Euse_rt =        Cal_r_E || store_E || mtc0_E;
//    assign Muse_rt =        store_M || mtc0_M;
//    
//    // W part Data forwarding use Detector method
//    assign rs_Dforward =    (Duse_rs && rs_D != 0) && ((AO_M_rd && rs_D == rd_M) || (AO_M_rt && rs_D == rt_M)
//                            ) ? 2'b01 :     // AO_M
//                            (Duse_rs && rs_D != 0) && ((PC8_M_rd && rs_D == rd_M) || (PC8_M_ra && rs_D == `ra)
//                            ) ? 2'b10 :     // PC_M + 8 
//                                2'b00 ;     // RD1
//
//    assign rt_Dforward =    (Duse_rt && rt_D != 0) && ((AO_M_rd && rt_D == rd_M) || (AO_M_rt && rt_D == rt_M)
//                            ) ? 2'b01 :     // AO_M
//                            (Duse_rt && rt_D != 0) && ((PC8_M_rd && rt_D == rd_M) || (PC8_M_ra && rt_D == `ra)
//                            ) ? 2'b10 :     // PC_M + 8
//                                2'b00 ;     // RD2
//    
//    assign rs_Eforward =    (Euse_rs && rs_E != 0) && ((AO_M_rd && rs_E == rd_M) || (AO_M_rt && rs_E == rt_M) 
//                            ) ? 2'b01 :    // AO_M
//                            (Euse_rs && rs_E != 0) && ((PC8_M_rd && rs_E == rd_M) || (PC8_M_ra && rs_E == `ra) 
//                            ) ? 2'b10 :    // PC8_M
//                            (Euse_rs && rs_E != 0) && ((RegWrite_W && rs_E == WriteAddr_W)
//                            ) ? 2'b11 :    // Result_W                                     
//                                2'b00 ;
//            
//    assign rt_Eforward =    (Euse_rt && rt_E != 0) && ((AO_M_rd && rt_E == rd_M) || (AO_M_rt && rt_E == rt_M)
//                            ) ? 2'b01 :
//                            (Euse_rt && rt_E != 0) && ((PC8_M_rd && rt_E == rd_M) || (PC8_M_ra && rt_E == `ra)
//                            ) ? 2'b10 :
//                            (Euse_rt && rt_E != 0) && ((RegWrite_W && rt_E == WriteAddr_W)
//                            ) ? 2'b11 :    // Result_W
//                                2'b00 ;
//    
//    assign rt_Mforward =    (Muse_rt && rt_M != 0) && (RegWrite_W && rt_M == WriteAddr_W);// Result_W
//                            // RT_M
    
    
endmodule
