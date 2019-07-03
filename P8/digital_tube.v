`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:36 12/23/2018 
// Design Name: 
// Module Name:    digital_tube 
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
`define NEGATIVE 8'b11111110
`define POSITIVE 8'b11111111
module digital_tube(
    input           clk,
    input           reset,
    input           WE,
    input           addr,
    input [31:0]    din,
    // output
    output [7:0]    digital_tube2,
    output          digital_tube_sel2,
    output [7:0]    digital_tube1,
    output reg[3:0] digital_tube_sel1,
    output [7:0]    digital_tube0,
    output reg[3:0] digital_tube_sel0,
    output [31:0]   RD
    );
    
    reg [31:0] count, data_display;
    reg [3:0] signed_bit;
    
    assign RD = addr ? {28'b0, signed_bit} : data_display;

    wire [3:0] led0, led1;
    assign led0 =   
                digital_tube_sel0[0] ?  data_display[3:0] :
                digital_tube_sel0[1] ?  data_display[7:4] :
                digital_tube_sel0[2] ?  data_display[11:8] :
                digital_tube_sel0[3] ?  data_display[15:12] :
                                        4'b0 ;
    assign led1 =   
                digital_tube_sel1[0] ?  data_display[19:16] :
                digital_tube_sel1[1] ?  data_display[23:20] :
                digital_tube_sel1[2] ?  data_display[27:24] :
                digital_tube_sel1[3] ?  data_display[31:28] :
                                        4'b0 ;
    display_digital tube3_0(
        .din(led0), 
        .reset(reset),
        .dout(digital_tube0)
    );
    display_digital tube7_4(
        .din(led1), 
        .reset(reset),
        .dout(digital_tube1)
    );
    display_digital tube8(
        .din(signed_bit[3:0]),
        .reset(reset),
        .dout(digital_tube2)
    );
    assign digital_tube_sel2 = 1'b1;
    
    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            digital_tube_sel0 <= 4'h1;
            digital_tube_sel1 <= 4'h1;
            data_display <= 0;
            signed_bit <= 4'b0;
        end
        else if (WE) begin
            if (addr) begin
                signed_bit[3:0] <= din[3:0];
            end
            else begin
                data_display <= din;
            end
//            digital_tube_sel0 <= 4'b0001;
//            digital_tube_sel1 <= 4'b0001;
        end
        else begin
            if (count == 32'd200000) begin
                count <= 0;
                // tube0
                case (digital_tube_sel0)
                    4'b0001: digital_tube_sel0 <= 4'b0010;
                    4'b0010: digital_tube_sel0 <= 4'b0100;
                    4'b0100: digital_tube_sel0 <= 4'b1000;
                    default: digital_tube_sel0 <= 4'b0001;
                endcase
                // tube1
                case (digital_tube_sel1)
                    4'b0001: digital_tube_sel1 <= 4'b0010;
                    4'b0010: digital_tube_sel1 <= 4'b0100;
                    4'b0100: digital_tube_sel1 <= 4'b1000;
                    default: digital_tube_sel1 <= 4'b0001;
                endcase
            end
            else begin
                count <= count + 1;
            end
        end
    end


endmodule
