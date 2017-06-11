`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 02:39:30 PM
// Design Name: 
// Module Name: module_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module module_top(

input external_clk,
input reset,
input wire tmr_in,
input wire test_en,
input wire [15:0] A,
input wire [15:0] B,
input wire [3:0] ALU_CTRL,
input wire SHIFTER_CTRL,

output wire [15:0] Answer

    );
    
wire clk;
wire internal_clk;
wire [15:0] ALU_out;  

  
ALU alu(
    .clk(clk),
    .A(A),
    .B(B),
    .Control(ALU_CTRL),
    .Answer(ALU_out)

);

shifter shift_mdl(
    .clk(clk),
    .Control(SHIFTER_CTRL),
    .A(ALU_out),
    .Answer(Answer)
);

clock_module clock_1(
	.clk(internal_clk)
	);

dft dft_bypass (
    .reset(reset),
    .internal_clk(internal_clk),
    .external_clk(external_clk),
    .test_en(test_en),
    .tmr_serial(tmr_in),
    .clk_out(clk)
);

endmodule
