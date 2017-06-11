`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2017 07:04:26 PM
// Design Name: 
// Module Name: clock_module
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


module clock_module(
    output clk
    );
    
initial clk = 0;

always
begin
forever #10 clk = ~clk;
end
endmodule
