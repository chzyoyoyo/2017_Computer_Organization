module Pipeline_Reg( clk_i, rst_n, reg_in_i, reg_out_o );

parameter size = 0;

//I/O ports
input           clk_i;
input	        rst_n;
input  [size-1:0] reg_in_i;
output [size-1:0] reg_out_o;
 
//Internal Signals
reg    signed [size-1:0] RegFile;

assign reg_out_o = RegFile;

always @( negedge rst_n or posedge clk_i )
begin
	if(rst_n == 0)
		RegFile <= 0;
	else
		RegFile <= reg_in_i;

end

endmodule

