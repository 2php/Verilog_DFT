`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 11:43:34 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
	input wire [15:0] A,
	input wire [15:0] B,
	input wire [3:0] Control,
	output reg [15:0] Answer
    );
    
    always@(*)	begin
    //|Control is {F0 F1 ENA ENB INVA INC}
        case (Control)
            4'b0000: Answer = A;
            
            4'b0001: Answer = B;
            
            4'b0010: Answer = ~A;
            
            4'b0011: Answer = ~B;
            
            4'b0100: Answer = A+B;
            
            4'b0101: Answer = A + 1;
            
            4'b0110: Answer = B + 1;
            
            4'b0111: Answer = B - A;
            
            4'b1000: Answer = A - B;
            
            4'b1001: Answer = A & B;
            
            4'b1010: Answer = A | B;
            
            default: Answer = 16'd0;
            
        endcase
   end 
endmodule
