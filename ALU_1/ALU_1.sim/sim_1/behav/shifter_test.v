`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 02:26:55 PM
// Design Name: 
// Module Name: shifter_test
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


module shifter_test;

reg clk;
reg Control;
reg [15:0] A;

wire [15:0] Answer;

shifter shift_mdl(
.clk(clk),
.Control(Control),
.A(A),
.Answer(Answer)
);

initial begin
    clk = 0;
    A = 16'd10;
    Control = 1'b0;
    
    #100;
    A = 16'd9;
    Control = 1'b1;
end 
initial begin forever #50 clk = ~clk; end 
endmodule
