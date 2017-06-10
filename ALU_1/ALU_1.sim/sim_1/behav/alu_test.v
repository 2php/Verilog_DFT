`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 12:43:52 PM
// Design Name: 
// Module Name: alu_test
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


module alu_test;

reg clk;
reg [15:0] A;
reg [15:0] B;
reg [3:0] Control;

wire [15:0] Answer;

ALU alu(
    .clk(clk),
    .A(A),
    .B(B),
    .Control(Control),
    .Answer(Answer)
);

initial begin
    clk = 0;
    A = 16'd10;
    B = 16'd20;
    Control = 4'b0100;
    
    #100;
    A = 16'd30;
    B = 16'd9;
    Control = 4'b1000;
end 
initial begin forever #50 clk = ~clk; end 

endmodule
