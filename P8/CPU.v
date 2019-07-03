`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:24 12/11/2018 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
    input           clk,
    input           clk_2,       // 2 times frequency for DM
    input           reset,
    input [7:2]     HWInt,
    input [31:0]    PrRD,
    // output
    output [31:0]   PrAddr,
    output          PrWE,
//    output [3:0]    PrBE,
    output [31:0]   PrWD
    );
    
    wire IntReq;
    
    // hazard signal
    wire IR_E_flush, IR_D_EN, PC_EN;
    wire [1:0] rs_Dforward;
	wire [1:0] rt_Dforward;
	wire [1:0] rs_Eforward;
	wire [1:0] rt_Eforward;
	wire rt_Mforward;
    
    /*************** pipeline register ***************/
    // IF/ID
    wire [31:0] instr_D, PC_D;
    wire [4:0] ExcCode_D;
    reg [31:0] instr_regD, PC_regD;
    reg [4:0] ExcCode_regD;
    // ID/EX
    wire [31:0] RS_E, RT_E, EXT_E;
    wire [4:0] ExcCode_E;
	reg [31:0]  instr_regE, PC_regE, RS_regE, RT_regE, EXT_regE;
    reg [4:0] ExcCode_regE;
    // EX/MEM
    wire [31:0] AO_M, RT_M;
    wire [4:0] ExcCode_M;
    reg [31:0] instr_regM, PC_regM, AO_regM, RT_regM;
    reg [4:0] ExcCode_regM;
    // MEM/WB
    wire [31:0] DMData_W, AO_W, cp0Data_W;
    reg [31:0] instr_regW, PC_regW, DMData_regW, AO_regW, cp0Data_regW;
    /*******************************************/
    // to bridge
    assign PrAddr = AO_regM;
    assign PrWD = RT_regM;
    
    /******************** F ********************/
    wire [31:0] EPC;
    wire [31:0] NPC;
    wire [1:0] PCsrc_D, PCsrc_F;
    wire eret_flush_D;
    initial begin
        instr_regD <= 0;
        PC_regD <= 0;
        ExcCode_regD <= 0;
    end
    assign PCsrc_F = IntReq ? 2'b11 : PCsrc_D;
    Fpart IF(   
        .clk(clk),
        .clk_2(clk_2),
        .reset(reset),
        .EN(PC_EN),
        .npc(NPC),
        .EPC(EPC),
        .PCsrc(PCsrc_F),
        // output
        .instr_D(instr_D),
        .PC_D(PC_D),
        .ExcCode_D(ExcCode_D)
    );
    // IF_ID
    always @(posedge clk) begin
        if (reset || eret_flush_D) begin
            instr_regD <= 0;
            PC_regD <= 0;
            ExcCode_regD <= 0;
        end
        else if (IR_D_EN) begin
            instr_regD <= (IntReq) ? 0 : instr_D;
            PC_regD <= PC_D;
            ExcCode_regD <= (IntReq) ? 5'b0 : ExcCode_D;
        end
    end
    
    /******************** Control Unit ********************/
    // D part control signal
    wire [3:0] NPCsel_D;
    wire [1:0] ExtOp_D;
    wire legalIR_D;
    // E part control signal
    wire ALU_Asel_D, ALU_Bsel_D;
    reg ALU_Asel_regE, ALU_Bsel_regE;
    wire [3:0] ALUOp_D;
    reg [3:0] ALUOp_regE;
    // M part control signal
    wire MemWrite_D, cp0WE_D;
    reg MemWrite_regE, cp0WE_regE;
    reg MemWrite_regM, cp0WE_regM;
    // W part control signal
    wire RegWrite_D;
    wire [1:0] Data2Reg_D, RegDst_D;
    wire [2:0] loadType_D;
    reg RegWrite_regE, RegWrite_regM, RegWrite_regW;
    reg [1:0]   Data2Reg_regE, Data2Reg_regM, Data2Reg_regW,
                RegDst_regE, RegDst_regM, RegDst_regW;
    reg [2:0] loadType_regE, loadType_regM, loadType_regW;
    // Control Unit
    controller ControlUnit (
        .instr(instr_regD), 
        // D
        .PCsrc(PCsrc_D), // for F part
        .eret_flush_D(eret_flush_D),  // for IF/ID pipe reg
        .NPCsel(NPCsel_D), 
        .ExtOp(ExtOp_D), 
        .legalIR(legalIR_D), 
        // E
        .ALU_Asel(ALU_Asel_D), 
        .ALU_Bsel(ALU_Bsel_D), 
        .ALUOp(ALUOp_D), 
        // M
        .MemWrite(MemWrite_D), 
        .cp0WE(cp0WE_D), 
        // W
        .RegWrite(RegWrite_D), 
        .Data2Reg(Data2Reg_D), 
        .RegDst(RegDst_D), 
        .loadType(loadType_D)
    );
    always @(posedge clk) begin
        if (reset) begin
            // E
            ALU_Asel_regE <= 0;
            ALU_Bsel_regE <= 0;
            ALUOp_regE <= 0;
            // M
            MemWrite_regE <= 0;
            MemWrite_regM <= 0;
            cp0WE_regE <= 0;
            cp0WE_regM <= 0;
            // W
            RegWrite_regE <= 0;
            RegWrite_regM <= 0;
            RegWrite_regW <= 0;
            Data2Reg_regE <= 0;
            Data2Reg_regM <= 0;
            Data2Reg_regW <= 0;
            RegDst_regE <= 0;
            RegDst_regM <= 0;
            RegDst_regW <= 0;
            loadType_regE <= 0;
            loadType_regM <= 0;
            loadType_regW <= 0;
        end
        else begin
            ALU_Asel_regE <= ALU_Asel_D;
            ALU_Bsel_regE <= ALU_Bsel_D;
            ALUOp_regE <= ALUOp_D;
            // M
            MemWrite_regE <= MemWrite_D;
            MemWrite_regM <= MemWrite_regE;
            cp0WE_regE <= cp0WE_D;
            cp0WE_regM <= cp0WE_regE;
            // W
            RegWrite_regE <= RegWrite_D;
            RegWrite_regM <= RegWrite_regE;
            RegWrite_regW <= RegWrite_regM;
            Data2Reg_regE <= Data2Reg_D;
            Data2Reg_regM <= Data2Reg_regE;
            Data2Reg_regW <= Data2Reg_regM;
            RegDst_regE <= RegDst_D;
            RegDst_regM <= RegDst_regE;
            RegDst_regW <= RegDst_regM;
            loadType_regE <= loadType_D;
            loadType_regM <= loadType_regE;
            loadType_regW <= loadType_regM;
        end
    end
    /******************** ctrl unit ********************/

    /******************** D ********************/
    wire [31:0] Result_W;
    wire [4:0] WriteAddr_W;
    wire RegWrite_W;
    initial begin
        instr_regE <= 0;
        PC_regE <= 0;
        RS_regE <= 0;
        RT_regE <= 0;
        EXT_regE <= 0;
        ExcCode_regE <= 0;
    end
    Dpart ID(
        // ctrl signal
        .NPCsel(NPCsel_D),
        .ExtOp(ExtOp_D),
        .legalIR(legalIR_D), 
        // 
        .clk(clk),
        .reset(reset),
        .PC_D(PC_regD),
        .instr(instr_regD),
        .ExcCode_D(ExcCode_regD),
        // from write back part
//        .WPC8_W(PC_regW + 8),
        .RegWrite_W(RegWrite_regW),
        .Result_W(Result_W),
        .WriteAddr_W(WriteAddr_W),
        // forward data and select signal
        .AO_regM(AO_regM),
        .PC8_regM(PC_regM + 8),
        .rs_Dforward(rs_Dforward),
        .rt_Dforward(rt_Dforward),
        // output
        .RS_E(RS_E),
        .RT_E(RT_E),
        .EXT_E(EXT_E),
        // Fpart PC control
        .npc(NPC),                    // to F part
        // P7
        .ExcCode_E(ExcCode_E)
    );
    // ID_EX
    always @(posedge clk) begin
        if (reset) begin
            instr_regE <= 0;
            PC_regE <= 0;
            RS_regE <= 0;
            RT_regE <= 0;
            EXT_regE <= 0;
            ExcCode_regE <= 0;
        end
        else begin
            instr_regE <= (IntReq || IR_E_flush) ? 0 : instr_regD;
            PC_regE <= PC_regD;
            RS_regE <= RS_E;
            RT_regE <= RT_E;
            EXT_regE <= EXT_E;
            ExcCode_regE <= (IntReq || IR_E_flush) ? 5'b0 : ExcCode_E;
        end
    end
    /******************** D finish ********************/
    
    /******************** E ********************/
    initial begin
        instr_regM <= 0;
        AO_regM <= 0;
        PC_regM <= 0;
        RT_regM <= 0;
        ExcCode_regM <= 0;
    end
    Epart EX(
        // ctrl signal
        .ALU_Asel(ALU_Asel_regE),
        .ALU_Bsel(ALU_Bsel_regE),
        .ALUOp(ALUOp_regE),
        //
        .instr(instr_regE),
//        .PC_E(PC_regE),
        .EXT_E(EXT_regE),
        .RS_E(RS_regE),
        .RT_E(RT_regE),
        
        .ExcCode_E(ExcCode_regE),
        // forward data and select signal
        .AO_regM(AO_regM),
        .PC8_regM(PC_regM + 8),
        .Result_W(Result_W),  
        .rs_Eforward(rs_Eforward),
        .rt_Eforward(rt_Eforward),
        // output
        .AO_M(AO_M),
        .RT_M(RT_M),
        .ExcCode_M(ExcCode_M)
    );
    // EX_MEM
    always @(posedge clk) begin
        if (reset) begin
            instr_regM <= 0;
            AO_regM <= 0;
            PC_regM <= 0;
            RT_regM <= 0;
            ExcCode_regM <= 0;
        end
        else begin
            instr_regM <= (IntReq) ? 0 : instr_regE;
            PC_regM <= PC_regE;
            AO_regM <= AO_M;
            RT_regM <= RT_M;
            ExcCode_regM <= (IntReq) ? 5'b0 : ExcCode_M;
        end
    end
    /******************** E finish ********************/
    
    /******************** M ********************/
    // cp0 signal
    wire [31:0] cp0DataIN;
    wire [4:0] ExcCode_cp0;
    reg IntEN_reg;
//    wire IntEN;
    
    initial begin
        instr_regW <= 0;
        PC_regW <= 0;
        DMData_regW <= 0;
        AO_regW <= 0;
        cp0Data_regW <= 0;
    end
    Mpart MEM(
        // ctrl signal
        .MemWrite(MemWrite_regM),
        //
        .clk(clk_2),         // 2 times frequency
        .reset(reset),
        .instr(instr_regM),
        .AO_M(AO_regM),
        .RT_M(RT_regM),
//        .PC_M(PC_regM),
        // P7
        .ExcCode_M(ExcCode_regM),
        .PrRD(PrRD),
        .IntReq(IntReq),
        // forward data and select signal
        .Result_W(Result_W),  
        .rt_Mforward(rt_Mforward),
        // output
        .DMData_W(DMData_W),
        // P7
        .ExcCode_cp0(ExcCode_cp0),
        .cp0DataIN(cp0DataIN),
//        .PrBE(PrBE),
        .PrWE(PrWE),
        .IntEN(IntEN)
    );
    // MEM_WB
    always @(posedge clk) begin
        if (reset) begin
            IntEN_reg <= 0;
            instr_regW <= 0;
            PC_regW <= 0;
            DMData_regW <= 0;
            AO_regW <= 0;
            cp0Data_regW <= 0;
        end
        else begin
            IntEN_reg <= IntEN;
            instr_regW <= IntReq ? 0 : instr_regM;
            PC_regW <= PC_regM;
            AO_regW <= AO_regM;
            DMData_regW <= DMData_W;
            cp0Data_regW <= cp0Data_W;
        end
    end
    /******************** M finish ********************/
    
    /*************** Coprocessor0 ***************/
    // regard cp0 at M part
    Coprocessor0 cp0(
        .clk(clk), 
        .reset(reset), 
        .instr(instr_regW),
        .A1(instr_regM[15:11]),// read CP0 register  mfc0
        .A2(instr_regM[15:11]),// write CP0 register mtc0
        .din(cp0DataIN), 
        .PC(PC_regM), 
        .ExcCode( (|HWInt) ? 5'b0 : ExcCode_cp0), 
        .HWInt(HWInt), 
        .WE(cp0WE_regM & ~IntReq), 
        .EXLClr(IntEN_reg), 
        .EXLSet(IntReq), 
        // output
        .IntReq(IntReq), 
        .EPC(EPC), 
        .dout(cp0Data_W)
    );
    
    /*************** Coprocessor0 ***************/
    
    /******************** W ********************/
    Wpart WB(
        // ctrl signal
        .RegDst(RegDst_regW),
        .Data2Reg(Data2Reg_regW),
        .loadType(loadType_regW),
        .PC8_W(PC_regW + 8),
        .instr(instr_regW),
        .AO_W(AO_regW),
        .DMData_W(DMData_regW),
        .cp0Data_W(cp0Data_regW),
        // output
        .WriteAddr_W(WriteAddr_W),              // to D part and Hazard Unit
        .Result_W(Result_W)                     // to D part
    );
    /******************** W finish ********************/
    
    /******************** Hazard Unit ********************/
    hazard HazardUnit(
        .instr_D(instr_regD),
        .instr_E(instr_regE),
        .instr_M(instr_regM),
        .RegWrite_W(RegWrite_regW),
        .WriteAddr_W(WriteAddr_W),
        // output
        .IR_E_flush(IR_E_flush),
        .IR_D_EN(IR_D_EN),
        .PC_EN(PC_EN),
        .rs_Dforward(rs_Dforward),
        .rt_Dforward(rt_Dforward),
        .rs_Eforward(rs_Eforward),
        .rt_Eforward(rt_Eforward),
        .rt_Mforward(rt_Mforward),
        // P7
        .IntReq(IntReq)
    );

endmodule
