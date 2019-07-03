`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:44 11/24/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
    
    // hazard signal
    wire IR_E_clear, IR_D_EN, PC_EN;
    wire [1:0] rs_Dforward;
	wire [1:0] rt_Dforward;
	wire [2:0] rs_Eforward;
	wire [2:0] rt_Eforward;
	wire [2:0] rt_Mforward;
    
    /*************** pipeline register ***************/
    // IF/ID
    reg [31:0]  instr_regD, PC_regD;
    // ID/EX
	reg [31:0]  instr_regE, PC_regE, RS_regE, RT_regE, EXT_regE;
    // EX/MEM
    reg [31:0]  instr_regM, AO_regM, PC_regM, RT_regM;
    // MEM/WB
    reg [31:0]  instr_regW, PC_regW, DMData_regW, AO_regW;
    /*******************************************/

    /******************** F ********************/
    wire [31:0] NPC_F;
    //wire [31:0] Reg32_F;
    wire [1:0] PCsrc_F;

    wire [31:0] instr_D,    PC_D;
    
    initial begin
        instr_regD = 0;
        PC_regD = 0;
    end

    Fpart IF(
        .clk(clk),
        .reset(reset),
        .EN(PC_EN),
        //.Reg32(Reg32_F),
        .npc(NPC_F),            
        .PCsrc(PCsrc_F),
        // output
        .instr_D(instr_D),
        .PC_D(PC_D)
    );

    // IF_ID
    always @(posedge clk) begin
        if (reset) begin
            instr_regD <= 0;
            PC_regD <= 0;
        end
        else if (IR_D_EN) begin
            instr_regD <= instr_D;
            PC_regD <= PC_D;
        end
    end
    /******************** D ********************/
    wire [31:0] Result_W, WPC_W;
    wire [4:0] WriteAddr_W;
    wire RegWrite_W;

    wire [31:0] instr_E,    PC_E,       RS_E,       RT_E,       EXT_E;
    initial begin
        instr_regE = 0;
        PC_regE = 0;
        RS_regE = 0;
        RT_regE = 0;
        EXT_regE = 0;
    end

    Dpart ID(
        .clk(clk),
        .reset(reset),
        .PC_D(PC_regD),
        .instr(instr_regD),
        // for write back part
        .WPC_W(PC_regW),
        .RegWrite_W(RegWrite_W),
        .Result_W(Result_W),
        .WriteAddr_W(WriteAddr_W),
        // forward data and select signal
        .AO_regM(AO_regM),
        .PC8_regM(PC_regM + 8),
        .rs_Dforward(rs_Dforward),
        .rt_Dforward(rt_Dforward),
        // output
        .instr_E(instr_E),
        .PC_E(PC_E),
        .RS_E(RS_E),
        .RT_E(RT_E),
        .EXT_E(EXT_E),
        // Fpart PC control
        .npc(NPC_F),                    // to F part
        .PCsrc(PCsrc_F)                 // to F part
        //.Reg32(Reg32_F),                // to F part
    );
    // ID_EX
    always @(posedge clk) begin
        if (reset || IR_E_clear) begin
            instr_regE <= 0;
            PC_regE <= 0;
            RS_regE <= 0;
            RT_regE <= 0;
            EXT_regE <= 0;
        end
        else begin
            instr_regE <= instr_E;
            PC_regE <= PC_E;
            RS_regE <= RS_E;
            RT_regE <= RT_E;
            EXT_regE <= EXT_E;
        end
    end
    /******************** D finish ********************/
    
    /******************** E ********************/
    wire [31:0] instr_M,    AO_M,       PC_M,       RT_M;
    initial begin
        instr_regM = 0;
        AO_regM = 0;
        PC_regM = 0;
        RT_regM = 0;
    end
    Epart EX(
        .instr(instr_regE),
        .PC_E(PC_regE),
        .EXT_E(EXT_regE),
        .RS_E(RS_regE),
        .RT_E(RT_regE),
        // forward data and select signal
        .AO_regM(AO_regM),
        .AO_regW(AO_regW),
        .PC8_regM(PC_regM + 8),
        .PC8_regW(PC_regW + 8),
        .DMData_regW(DMData_regW),
        .rs_Eforward(rs_Eforward),
        .rt_Eforward(rt_Eforward),
        // output
        .instr_M(instr_M),
        .PC_M(PC_M),
        .AO_M(AO_M),
        .RT_M(RT_M)  
    );
    // EX_MEM
    always @(posedge clk) begin
        if (reset) begin
            instr_regM <= 0;
            AO_regM <= 0;
            PC_regM <= 0;
            RT_regM <= 0;
        end
        else begin
            instr_regM <= instr_M;
            AO_regM <= AO_M;
            PC_regM <= PC_M;
            RT_regM <= RT_M;
        end
    end
    /******************** E finish ********************/
    
    /******************** M ********************/
    wire [31:0] instr_W,    PC_W,       DMData_W,       AO_W;
    
    initial begin
        instr_regW = 0;
        PC_regW = 0;
        DMData_regW = 0;
        AO_regW = 0;
    end
    
    Mpart MEM(
        .clk(clk),
        .reset(reset),
        .instr(instr_regM),
        .AO_M(AO_regM),
        .RT_M(RT_regM),
        .PC_M(PC_regM),
        // forward data and select signal
        .AO_regW(AO_regW),
        .DMData_regW(DMData_regW),
        .PC8_regW(PC_regW + 8),
        .rt_Mforward(rt_Mforward),
        // output
        .instr_W(instr_W),
        .PC_W(PC_W),
        .DMData_W(DMData_W),
        .AO_W(AO_W)
    );
    // MEM_WB
    always @(posedge clk) begin
        if (reset) begin
            instr_regW <= 0;
            PC_regW <= 0;
            DMData_regW <= 0;
            AO_regW <= 0;
        end
        else begin
            instr_regW <= instr_W;
            PC_regW <= PC_W;
            DMData_regW <= DMData_W;
            AO_regW <= AO_W;
        end
    end
    /******************** M finish ********************/
    
    /******************** W ********************/
    Wpart WB(
        .PC_W(PC_regW),
        .instr(instr_regW),
        .AO_W(AO_regW),
        .DMData_W(DMData_regW),
        // output
        .RegWrite_W(RegWrite_W),                // to W part
        .WriteAddr_W(WriteAddr_W),              // to W part
        .Result_W(Result_W)                     // to W part
    );
    /******************** W finish ********************/
    
    /******************** Hazard Unit ********************/
    hazard HazardUnit(
        .instr_D(instr_regD),
        .instr_E(instr_regE),
        .instr_M(instr_regM),
        .instr_W(instr_regW),
        // output
        .IR_E_clear(IR_E_clear),
        .IR_D_EN(IR_D_EN),
        .PC_EN(PC_EN),
        .rs_Dforward(rs_Dforward),
        .rt_Dforward(rt_Dforward),
        .rs_Eforward(rs_Eforward),
        .rt_Eforward(rt_Eforward),
        .rt_Mforward(rt_Mforward)
    );

endmodule
