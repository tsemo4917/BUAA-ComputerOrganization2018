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
    input           reset,
    input           clk,
    input [7:2]     HWInt,
    input [31:0]    PrRD,
//    input           data_sel,
    // output
    output [31:0]   PrAddr,
    output          PrWE,
//    output [3:0]    PrBE,
    output [31:0]   PrWD
    );
    

    // hazard signal
    wire IR_E_flush, IR_D_EN, PC_EN;
    wire [1:0] rs_Dforward;
	wire [1:0] rt_Dforward;
	wire [2:0] rs_Eforward;
	wire [2:0] rt_Eforward;
	wire [1:0] rt_Mforward;
    wire busy;
    
    /*************** pipeline register ***************/
    // IF/ID
    wire [31:0] instr_D, PC_D;
    wire [4:0] ExcCode_D;
    reg [31:0] instr_regD, PC_regD;
    reg [4:0] ExcCode_regD;
    // ID/EX
    wire [31:0] instr_E, PC_E, RS_E, RT_E, EXT_E;
    wire [4:0] ExcCode_E;
	reg [31:0]  instr_regE, PC_regE, RS_regE, RT_regE, EXT_regE;
    reg [4:0] ExcCode_regE;
    // EX/MEM
    wire [31:0] instr_M, AO_M, PC_M, RT_M, HILO_M;
    wire [4:0] ExcCode_M, ExcCode_cp0;
    reg [31:0] instr_regM, PC_regM, AO_regM, RT_regM, HILO_regM;
    reg [4:0] ExcCode_regM;
    // MEM/WB
    wire [31:0] instr_W, PC_W, DMData_W, AO_W, HILO_W, cp0Data_W;
    reg [31:0] instr_regW, PC_regW, DMData_regW, AO_regW, HILO_regW, cp0Data_regW;
    /*******************************************/
    // cp0 signal
    wire [31:0] EPC;
//    wire [3:0] PrWD, PrRD;
    wire IntEN;
//    reg IntEN_reg;
    
    // to bridge
    assign PrAddr = AO_regM;
    assign PrWD = RT_regM;
    
    /******************** F ********************/
    wire [31:0] NPC_F;
    wire [1:0] PCsrc_F;
    wire eret_flush_D;
    initial begin
        instr_regD <= 0;
        PC_regD <= 0;
        ExcCode_regD <= 0;
    end
    Fpart IF(
        .clk(clk),
        .reset(reset),
        .EN(PC_EN),
        .npc(NPC_F),
        .EPC(EPC),
        .IntReq(IntReq),
        .PCsrc(PCsrc_F),
        // output
        .instr_D(instr_D),
        .PC_D(PC_D),
        .ExcCode_D(ExcCode_D)
    );
    // IF_ID
    always @(posedge clk) begin
//        IntEN_reg <= IntEN;
        if (reset || IntReq) begin
            instr_regD <= 0;
//            PC_regD <= 0;
//            ExcCode_regD <= 0;
        end
        else if (IR_D_EN) begin
            instr_regD <= eret_flush_D ? 0 : instr_D;
            PC_regD <= PC_D;
            ExcCode_regD <= ExcCode_D;
        end
    end

    /******************** D ********************/
    wire [31:0] Result_W, WPC_W;
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
        .clk(clk),
        .reset(reset),
        .PC_D(PC_regD),
        .instr(instr_regD),
        .ExcCode_D(ExcCode_regD),
        // for write back part
        .WPC_W(PC_regW),
        .RegWrite_W(RegWrite_W),
        .Result_W(Result_W),
        .WriteAddr_W(WriteAddr_W),
        // forward data and select signal
        .AO_regM(AO_regM),
        .PC8_regM(PC_regM + 8),
        .HILO_regM(HILO_regM),
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
        .PCsrc(PCsrc_F),                // to F part
        
        .ExcCode_E(ExcCode_E),
        .eret_flush_D(eret_flush_D)
    );
    // ID_EX
    always @(posedge clk) begin
//        if (reset || IR_E_flush || IntReq) begin
//            instr_regE <= 0;
//            PC_regE <= 0;
//            RS_regE <= 0;
//            RT_regE <= 0;
//            EXT_regE <= 0;
//            ExcCode_regE <= 0;
//        end
//        else begin
            instr_regE <= (reset || IR_E_flush || IntReq) ? 0 : instr_E;
            PC_regE <= PC_E;
            RS_regE <= RS_E;
            RT_regE <= RT_E;
            EXT_regE <= EXT_E;
            ExcCode_regE <= (reset || IR_E_flush || IntReq) ? 0 : ExcCode_E;
//        end
    end
    /******************** D finish ********************/
    
    /******************** E ********************/
    wire mulDivCal_E, mulDivCal_M, mtHILO_M;
    assign stopMD = IntReq && (mulDivCal_E || mulDivCal_M);
    assign returnPreHILO = IntReq && mtHILO_M;
    initial begin
        instr_regM <= 0;
        AO_regM <= 0;
        PC_regM <= 0;
        RT_regM <= 0;
        HILO_regM <= 0;
        ExcCode_regM <= 0;
    end
    Epart EX(
        .clk(clk),
        .reset(reset),
        .instr(instr_regE),
        .PC_E(PC_regE),
        .EXT_E(EXT_regE),
        .RS_E(RS_regE),
        .RT_E(RT_regE),
        
        .ExcCode_E(ExcCode_regE),
        .stopMD(stopMD),          
        .returnPreHILO(returnPreHILO), 
        // forward data and select signal
        .AO_regM(AO_regM),
        .PC8_regM(PC_regM + 8),
        .HILO_regM(HILO_regM),
        .Result_W(Result_W),  
        .rs_Eforward(rs_Eforward),
        .rt_Eforward(rt_Eforward),
        // output
        .instr_M(instr_M),
        .PC_M(PC_M),
        .AO_M(AO_M),
        .RT_M(RT_M),
        .HILO_M(HILO_M),
        .busy(busy),
        .ExcCode_M(ExcCode_M)
    );
    // EX_MEM
    always @(posedge clk) begin
//        if (reset || IntReq) begin
//            instr_regM <= 0;
//            AO_regM <= 0;
//            PC_regM <= 0;
//            RT_regM <= 0;
//            HILO_regM <= 0;
//            ExcCode_regM <= 0;
//        end
//        else begin
            instr_regM <= (reset || IntReq) ? 0 : instr_M;
            AO_regM <= AO_M;
            PC_regM <= PC_M;
            RT_regM <= RT_M;
            HILO_regM <= HILO_M;
            ExcCode_regM <= (reset || IR_E_flush || IntReq) ? 0 : ExcCode_M;
//        end
    end
    /******************** E finish ********************/
    
    /******************** M ********************/
    wire cp0WE;
    wire [31:0] cp0DataIN;
    initial begin
        instr_regW <= 0;
        PC_regW <= 0;
        DMData_regW <= 0;
        AO_regW <= 0;
        HILO_regW <= 0;
        cp0Data_regW <= 0;
    end
    Mpart MEM(
        .clk(clk),
        .reset(reset),
        .instr(instr_regM),
        .AO_M(AO_regM),
        .RT_M(RT_regM),
        .PC_M(PC_regM),
        .HILO_M(HILO_regM),
        // P7
        .ExcCode_M(ExcCode_regM),
        .PrRD(PrRD),
        .IntReq(IntReq),
//        .data_sel(data_sel),
        // forward data and select signal
        .Result_W(Result_W),  
        .rt_Mforward(rt_Mforward),
        // output
        .instr_W(instr_W),
        .PC_W(PC_W),
        .DMData_W(DMData_W),
        .AO_W(AO_W),
        .HILO_W(HILO_W),
        // P7
        .ExcCode_cp0(ExcCode_cp0),
        .cp0WE(cp0WE),
        .cp0DataIN(cp0DataIN),
        .IntEN(IntEN),
        // bridge
        .PrWE(PrWE)
    );
    // MEM_WB
    always @(posedge clk) begin
//        if (reset) begin
//            instr_regW <= 0;
//            PC_regW <= 0;
//            DMData_regW <= 0;
//            AO_regW <= 0;
//            HILO_regW <= 0;
//            cp0Data_regW <= 0;
//        end
//        else begin
            instr_regW <= (reset || IntReq) ? 0 : instr_W;
            PC_regW <= PC_W;
            DMData_regW <= DMData_W;
            AO_regW <= AO_W;
            HILO_regW <= HILO_W;
            cp0Data_regW <= cp0Data_W;
//        end
    end
    /******************** M finish ********************/
    
    /*************** Coprocessor0 ***************/
    // regard cp0 at M part
    Coprocessor0 cp0(
        .reset(reset), 
        .clk(clk), 
        .instr(instr_regW),
        .A1(instr_regM[15:11]),// read CP0 register  mfc0
        .A2(instr_regM[15:11]),// write CP0 register mtc0
        .din(cp0DataIN), 
        .PC(PC_regM), 
        .ExcCode( (|HWInt) ? 5'b0 : ExcCode_cp0), 
        .HWInt(HWInt), 
        .WE(cp0WE), 
        .EXLSet(IntReq), 
        .EXLClr(IntEN), 
        // output
        .IntReq(IntReq), 
        .EPC(EPC), 
        .dout(cp0Data_W)
    );
    
    /*************** Coprocessor0 ***************/
    
    /******************** W ********************/
    Wpart WB(
        .PC_W(PC_regW),
        .instr(instr_regW),
        .AO_W(AO_regW),
        .DMData_W(DMData_regW),
        .HILO_W(HILO_regW),
        .cp0Data_W(cp0Data_regW),
        // output
        .RegWrite_W(RegWrite_W),                // to D part and Hazard Unit
        .WriteAddr_W(WriteAddr_W),              // to D part and Hazard Unit
        .Result_W(Result_W)                     // to D part
    );
    /******************** W finish ********************/
    
    /******************** Hazard Unit ********************/
    hazard HazardUnit(
        .instr_D(instr_regD),
        .instr_E(instr_regE),
        .instr_M(instr_regM),
        .RegWrite_W(RegWrite_W),
        .WriteAddr_W(WriteAddr_W),
        .busy(busy),
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
        .IntReq(IntReq),
        .mulDivCal_E(mulDivCal_E), 
        .mulDivCal_M(mulDivCal_M), 
        .mtHILO_M(mtHILO_M)
    );

endmodule
