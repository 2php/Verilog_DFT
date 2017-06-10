`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 02:46:40 PM
// Design Name: 
// Module Name: top_test
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


module top_test;

reg clk;
reg [15:0] A;
reg [15:0] B;
reg [3:0] ALU_CTRL;
reg SHIFTER_CTRL;

wire [15:0] Answer;

module_top top(
    .clk(clk),
    .A(A),
    .B(B),
    .ALU_CTRL(ALU_CTRL),
    .SHIFTER_CTRL(SHIFTER_CTRL),
    .Answer(Answer)
);

initial begin
    clk = 0;
    A = 16'd10;
    B = 16'd20;
    ALU_CTRL = 4'b0100;
    SHIFTER_CTRL = 1'b0;
    
    #100;
    A = 16'd30;
    B = 16'd9;
    ALU_CTRL = 4'b1000;
    SHIFTER_CTRL = 1'b1;
end 
initial begin forever #50 clk = ~clk; end 
endmodule
