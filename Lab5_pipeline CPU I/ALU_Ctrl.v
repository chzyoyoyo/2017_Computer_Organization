module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, leftRight, FURslt_o, JumpType_o );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     leftRight;
output     [2-1:0] FURslt_o;
output     JumpType_o;
     
//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;

//Main function
/*your code here*/
assign ALU_operation_o = 
						(ALUOp_i == 3'd4 || ALUOp_i == 3'd0)? 4'b0010:
						(funct_i == 6'd32)? 4'b0010:
						(funct_i == 6'd34 || ALUOp_i == 3'd1 || ALUOp_i == 3'd6)? 4'b0110:
						(funct_i == 6'd36)? 4'b0000:
						(funct_i == 6'd37)? 4'b0001:
						(funct_i == 6'd39)? 4'b1100:
						(funct_i == 6'd42)? 4'b0111:
						(funct_i == 6'd0)? 4'b0001:
						(funct_i == 6'd2)? 4'b0000:
						4'b0000;
assign FURslt_o = (ALUOp_i == 3'd5)? 2'b10 : 
				(ALUOp_i == 3'd4 || ALUOp_i == 3'd0)? 2'b00:
				(funct_i == 6'd0 || funct_i == 6'd2)? 2'b01 : 2'b00;
				
assign leftRight = (funct_i == 6'd2)? 0 : 1;

assign JumpType_o = (ALUOp_i == 3'd2 && funct_i == 6'd8)? 1 : 0;


endmodule     
