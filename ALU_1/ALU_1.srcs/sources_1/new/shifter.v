`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2017 02:20:54 PM
// Design Name: 
// Module Name: shifter
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


module shifter(
    input clk,
    input wire enable,
    input wire [15:0] A,
    output reg [15:0] Answer 
    );
    
    always@(*)	begin
        case (enable)  
            1'b1: Answer = {A[14:0],1'b0};
            
            default: Answer = A;
        endcase 
    end 
endmodule
