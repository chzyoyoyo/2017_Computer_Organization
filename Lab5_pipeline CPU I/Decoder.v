module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Memwrite_o, MemRead_o, Branch_o, BranchType_o, MemtoReg_o, Jump_o );
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output	[2-1:0]	RegDst_o;
output			Memwrite_o;
output			MemRead_o;
output			Branch_o;
output			BranchType_o;
output	[2-1:0]	MemtoReg_o;
output			Jump_o;

//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire	[2-1:0]	RegDst_o;
wire 			MemRead_o;
wire 			Memwrite_o;
wire 			Branch_o;
wire 			BranchType_o;
wire 			Jump_o;


//Main function
/*your code here*/

assign RegWrite_o = (instr_op_i == 6'd0 || instr_op_i == 6'd8 || instr_op_i == 6'd15 || instr_op_i == 6'd35 ||instr_op_i == 6'b000011)? 1 : 0;
assign RegDst_o = (instr_op_i == 6'd0 || instr_op_i == 6'd43)? 2'd1:
				  (instr_op_i == 6'd3)? 2'd2 : 2'd0;
assign ALUSrc_o = (instr_op_i == 6'd8 || instr_op_i == 6'd13 || instr_op_i == 6'd35 || instr_op_i == 6'd43)? 1 : 0;
assign ALUOp_o = (instr_op_i == 6'd0)? 3'd2:
				 (instr_op_i == 6'd8)? 3'd4:
				 (instr_op_i == 6'd15)? 3'd5: 
				 (instr_op_i == 6'd43 || instr_op_i == 6'd35)? 3'd0:
				 (instr_op_i == 6'd4)? 3'd1:
				 (instr_op_i == 6'd5)? 3'd6 : 3'd7;

assign Memwrite_o = (instr_op_i == 6'd43)? 1 : 0;
assign MemRead_o = (instr_op_i == 6'b100011)? 1 : 0;
assign MemtoReg_o = (instr_op_i == 6'b100011)? 2'd1:
						  (instr_op_i == 6'b000011)? 2'd2 : 2'd0;
assign Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101)? 1 : 0;
assign BranchType_o = (instr_op_i == 6'b000101)? 1 : 0;
assign Jump_o = (instr_op_i == 6'b000010 || instr_op_i == 6'b000011)? 1 : 0;



endmodule
   