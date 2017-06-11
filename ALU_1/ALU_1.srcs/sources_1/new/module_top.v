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

output wire [15:0] answer

    );
    
wire clk;
wire internal_clk;
wire [15:0] ALU_OUT;  
wire [15:0] Shifter_IN; 
wire [15:0] DFT_OUT; 

assign answer = (test_en)?DFT_OUT:SHIFT_OUT;


ALU alu(
    .clk(clk),
    .A(A),
    .B(B),
    .Control(ALU_CTRL),
    .Answer(ALU_OUT)
);

shifter shift_mdl(
    .clk(clk),
    .Control(SHIFT_CTRL),
    .A(SHIFT_IN),
    .Answer(SHIFT_OUT)
);

clock_module clock_1(
	.clk(internal_clk)
	);

dft dft_1 (
    .reset(reset),
    .internal_clk(internal_clk),
    .external_clk(external_clk),
    .ALU_OUT(ALU_OUT),
    .A(A),
    .test_en(test_en),
    .tmr_serial(tmr_in),
    .SHIFT_OUT(SHIFT_OUT),
    .SHIFT_ENA(SHIFT_CTRL),
    .SHIFT_IN(SHIFT_IN),
    .clk_out(clk),
    .dft_data_out(DFT_OUT)
);

endmodule
