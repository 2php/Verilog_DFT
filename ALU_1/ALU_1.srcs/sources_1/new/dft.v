`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2017 11:06:21 AM
// Design Name: 
// Module Name: dft
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


module dft(

	input 	         reset,
	input 	         internal_clk,
	input            external_clk,

	// dft control signals
	input 	         test_en,
	input 	         tmr_serial,


	output 	         clk_out




	//output 	[15:0]   dft_data_out

    );
    
reg [1:0] tmr_reg          = 2'b00;
reg [1:0] tmr_serial_count = 2'b00;
reg       rx_done          = 1'b0 ;

// TMR test states
localparam BYPASS_TEST = 2'b01;

// Add other test states to this if needed

assign clk_out = ((test_en && rx_done) && tmr_reg==BYPASS_TEST)?external_clk:internal_clk;

always@(posedge external_clk or posedge reset) begin

    if (reset) begin
    
        tmr_reg <= 2'b00;
        tmr_serial_count <= 2'b00;
        
    end
    
    else begin
        case(tmr_serial_count)
        
            2'b00   : begin 
                        tmr_reg[0] <= tmr_serial;
                        tmr_serial_count <= tmr_serial_count + 2'b01;
                        rx_done <= 1'b0;
                      end
            2'b10   : begin
                        tmr_reg[1] <= tmr_serial;
                        tmr_serial_count <= 2'b11;
                        rx_done <= 1'b1;
                      end
            2'b11   : begin
                         tmr_reg <= tmr_serial;
                         tmr_serial_count <= 2'b11;
                         rx_done <= 1'b1;
                      end
            
            default : begin
                         tmr_reg <= 2'b00;
                         tmr_serial_count <= 2'b00;
                         rx_done <= 1'b0;
                      end
        endcase        
    end
    
end

endmodule
