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

	input 	          reset,
	input 	          internal_clk,
	input             external_clk,
	
	// ALU inputs
	input wire [15:0] A,
	//input wire [15:0] B,

	// dft control signals
	input 	          test_en,
	input 	          tmr_serial,

    input reg [15:0] ALU_OUT,
    input reg [15:0] SHIFT_OUT,

	output 	         clk_out,




	output 	[15:0]   dft_data_out,
	
	// Shifter inputs
    output wire SHIFT_ENA,
    output wire [15:0] SHIFT_IN

    );
    
reg [1:0] tmr_reg          = 2'b00;
reg [1:0] tmr_serial_count = 2'b00;
reg       rx_done          = 1'b0 ;

// TMR test states
localparam BYPASS_TEST = 2'b01;
localparam ALU_TEST = 2'b10;
localparam SHIFTER_TEST = 2'b11;

// Add other test states to this if needed

// ByPass test 
assign clk_out = ((test_en && rx_done) && tmr_reg==BYPASS_TEST)?external_clk:internal_clk;

if (test_en && rx_done) begin
    case(tmr_reg)
        ALU_TEST     : begin
                        assign dft_data_out = ALU_OUT;
                        assign SHIFT_ENA = 1'b0;
                        assign SHIFT_IN = 16'd0;
                       end
        SHIFTER_TEST : begin
                        assign dft_data_out = SHIFT_OUT;
                        assign SHIFT_ENA = 1'b1;
                        assign SHIFT_IN = A;
                       end
        default      : begin
                        assign dft_data_out = 16'd0;
                        assign SHIFT_ENA = 1'b0;
                        assign SHIFT_IN = 16'd0;
                       end
    endcase
end

always@(posedge external_clk or posedge reset) begin

    if (reset) begin
    
        tmr_reg <= 2'b00;
        tmr_serial_count <= 2'b00;
        
    end
    
    else begin
    // This section is used to get the serial TMR values
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
                         tmr_reg <= tmr_reg;
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
