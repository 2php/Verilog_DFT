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

input clk,
input wire [15:0] A,
input wire [15:0] B,
input wire [3:0] ALU_CTRL,
input wire SHIFTER_CTRL,

output wire [15:0] Answer

    );
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

endmodule
