module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
     
//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;

//Main function
/*your code here*/
assign ALU_operation_o = (funct_i == 6'd32)? 4'b0010:
						(funct_i == 6'd34)? 4'b0110:
						(funct_i == 6'd36)? 4'b0000:
						(funct_i == 6'd37)? 4'b0001:
						(funct_i == 6'd39)? 4'b1100:
						(funct_i == 6'd42)? 4'b0111:
						(funct_i == 6'd0)? 4'b0001:
						(funct_i == 6'd2)? 4'b0000:
						(ALUOp_i == 3'd4)? 4'b0010:
						4'b0000;
assign FURslt_o = (funct_i == 6'd0 || funct_i == 6'd2)? 2'b01:
				(ALUOp_i == 3'd5)? 2'b10 : 2'b00;




endmodule     
