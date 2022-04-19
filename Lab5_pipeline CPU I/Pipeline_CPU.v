//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Pipeline_CPU(
        clk_i,
		rst_n
		);
		
//I/O port
input         clk_i;
input         rst_n;

//Internal Signles
wire [31:0] four;
wire [31:0] pc_o;
//wire [31:0] Mux_PC_Source_o; 
wire [31:0] Adder1_o;
wire [31:0] Adder2_o;
wire [31:0] Instr_Memory_o;
wire [31:0] Read_Data_1;
wire [31:0] Read_Data_2;
wire [4:0] Reg_File_o;
wire [2:0] dec_ALUop;
wire dec_ALUSrc;
wire dec_branch;
wire dec_RegWrite;
wire [2-1:0]dec_RegDst;
wire [3:0] ALU_Ctrl_o;
wire [31:0] Sign_Extend_o;
wire [31:0] Mux_ALUSrc_o;
wire ALU_zero;
wire [31:0] ALU_result;
//wire [31:0] Shifter_o;
wire  pc_source_mux;

wire shift_leftRight;
wire [1:0] FUR_slt_o;
wire [31:0] Zero_Filled_o;
wire ALU_overflow;
wire [31:0] Shifter_result;
wire [31:0] Mux_RD_o;


wire dec_Memwrite;
wire dec_Memread;
wire [2-1:0] dec_MemToReg;
wire dec_branchType;
wire dec_Jump;
wire Mux_BrType_o;
wire [31:0]Read_Data_o;
wire [31:0] Mux_WD_o;
wire [31:0] SLT1_o;
wire [31:0] Mux_BRSource_o;
wire [27:0] SLT2_o;
wire [31:0]Mux_JumpSource_o;
wire [31:0]Mux_JumpType_o;
wire AC_Jtype_o;
wire [5-1:0]reg31;

wire ID_Regwrite_o;
wire [2-1:0]ID_MemtoReg_o;
wire ID_MemWrite_o;
wire ID_MemRead_o;
wire ID_Branch_o;
wire [2-1:0] ID_RegDst_o;
wire ID_branchType_o;
wire [2:0] ID_ALUop_o;
wire ID_ALUSrc_o;
wire EX_Regwrite_o;
wire [2-1:0] EX_MemtoReg_o;
wire EX_MemWrite_o;
wire EX_MemRead_o;
wire EX_Branch_o;
wire MEM_Regwrite_o;
wire [2-1:0] MEM_MemtoReg_o;

wire [32-1:0] Instr_Memory_IF_o;
wire [32-1:0] Adder1_IF_o;
wire [32-1:0] Adder1_ID_o;
wire [32-1:0] Read_Data_ID_1;
wire [32-1:0] Read_Data_ID_2;
wire [32-1:0] Sign_Extend_ID_o;
wire [32-1:0] Zero_Filled_ID_o;
wire [5-1:0] Instr_Memory_ID_o1;
wire [5-1:0] Instr_Memory_ID_o2;
wire [5-1:0] Reg_File_EX_o;
wire [5-1:0] Reg_File_MEM_o;
wire [32-1:0] Read_Data_EX_2;
wire [32-1:0] Mux_RD_EX_o;
wire [32-1:0] Mux_RD_MEM_o;
wire [32-1:0] Adder2_EX_o;
wire Mux_BrType_EX_o;
wire [32-1:0] Read_Data_MEM_o;
wire [6-1:0] Instr_Memory_ID_o;
wire [5-1:0] Instr_Memory_ID_oo;

assign reg31 = 5'd31;
assign four = 32'd4;
assign pc_source_mux = ALU_zero & dec_branch;

//Greate componentes

Pipeline_Reg #(.size(32 + 32)) IF(
        .clk_i(clk_i),      
        .rst_n (rst_n),     
        .reg_in_i({Adder1_IF_o, Instr_Memory_IF_o}) ,   
        .reg_out_o({Adder1_ID_o, Instr_Memory_o})
        );

Pipeline_Reg #(.size(5+6+5+5+32+32+32+32+32 + 1+2 + 1+1+1 + 2+1+3+1)) ID(
        .clk_i(clk_i),      
        .rst_n (rst_n),     
        .reg_in_i({Instr_Memory_o[10:6],Instr_Memory_o[5:0], Instr_Memory_o[15:11], Instr_Memory_o[20:16], Zero_Filled_ID_o, Sign_Extend_ID_o, Read_Data_ID_1, Read_Data_ID_2, Adder1_ID_o, ID_Regwrite_o, ID_MemtoReg_o, ID_MemWrite_o, ID_MemRead_o, ID_Branch_o, ID_RegDst_o, ID_branchType_o, ID_ALUop_o, ID_ALUSrc_o}) ,   
        .reg_out_o({Instr_Memory_ID_oo, Instr_Memory_ID_o, Instr_Memory_ID_o2, Instr_Memory_ID_o1, Zero_Filled_o, Sign_Extend_o, Read_Data_1, Read_Data_2, Adder1_o, EX_Regwrite_o, EX_MemtoReg_o, EX_MemWrite_o, EX_MemRead_o, EX_Branch_o, dec_RegDst, dec_branchType, dec_ALUop, dec_ALUSrc})
        );

Pipeline_Reg #(.size(1+32+32+32+5 + 1+2 + 1+1+1)) EX(
        .clk_i(clk_i),      
        .rst_n (rst_n),     
        .reg_in_i({Adder2_EX_o, Mux_BrType_EX_o, Mux_RD_EX_o, Read_Data_2, Reg_File_EX_o, EX_Regwrite_o, EX_MemtoReg_o, EX_MemWrite_o, EX_MemRead_o, EX_Branch_o}) ,   
        .reg_out_o({Adder2_o, Mux_BrType_o, Mux_RD_o, Read_Data_EX_2, Reg_File_MEM_o, MEM_Regwrite_o, MEM_MemtoReg_o, dec_Memwrite, dec_Memread, dec_branch})
        );

Pipeline_Reg #(.size(32+32+5 + 1 + 2)) MEM(
        .clk_i(clk_i),      
        .rst_n (rst_n),     
        .reg_in_i({Read_Data_MEM_o, Mux_RD_o, Reg_File_MEM_o, MEM_Regwrite_o, MEM_MemtoReg_o}) ,   
        .reg_out_o({Read_Data_o, Mux_RD_MEM_o, Reg_File_o, dec_RegWrite, dec_MemToReg})
        );





Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n (rst_n),     
	    .pc_in_i(Mux_BRSource_o) ,   
	    .pc_out_o(pc_o) 
	    );
	
Adder Adder1(
        .src1_i(four),     
	    .src2_i(pc_o),     
	    .sum_o(Adder1_IF_o)    
	    );
	
Instr_Memory IM(
            .pc_addr_i(pc_o),  
	    .instr_o(Instr_Memory_IF_o)    
	    );

Mux3to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(Instr_Memory_ID_o1),
        .data1_i(Instr_Memory_ID_o2),
        .data2_i(reg31),
        .select_i(dec_RegDst),
        .data_o(Reg_File_EX_o)
        );	

		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(Instr_Memory_o[25:21]) ,  
        .RTaddr_i(Instr_Memory_o[20:16]) ,  
        .Wrtaddr_i(Reg_File_o) , 

        .Wrtdata_i(Mux_WD_o), 
        
        .RegWrite_i (dec_RegWrite),
        .RSdata_o(Read_Data_ID_1) ,  
        .RTdata_o(Read_Data_ID_2)   
        );

Decoder Decoder(
        .instr_op_i(Instr_Memory_o[31:26]), 
        .RegWrite_o(ID_Regwrite_o), 
        .ALUOp_o(ID_ALUop_o),   
        .ALUSrc_o(ID_ALUSrc_o),   
        .RegDst_o(ID_RegDst_o),
        
        .Memwrite_o(ID_MemWrite_o),
        .MemRead_o(ID_MemRead_o),
        .MemtoReg_o(ID_MemtoReg_o),
        .Branch_o(ID_Branch_o),
        .BranchType_o(ID_branchType_o),
        .Jump_o(dec_Jump)
        );

ALU_Ctrl AC(
        .funct_i(Instr_Memory_ID_o),   
        .ALUOp_i(dec_ALUop),   
        .ALU_operation_o(ALU_Ctrl_o),
		.leftRight(shift_leftRight),
        .FURslt_o(FUR_slt_o),
        .JumpType_o(AC_Jtype_o)
        );
	
Sign_Extend SE(
        .data_i(Instr_Memory_o[15:0]),
        .data_o(Sign_Extend_ID_o)
        );


Zero_Filled ZF(
        .data_i(Instr_Memory_o[15:0]),
        .data_o(Zero_Filled_ID_o)
        );

Mux2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(Read_Data_2),
        .data1_i(Sign_Extend_o),
        .select_i(dec_ALUSrc),
        .data_o(Mux_ALUSrc_o)
        );	
		
ALU ALU(
        .aluSrc1(Read_Data_1),
        .aluSrc2(Mux_ALUSrc_o),
        .ALU_operation_i(ALU_Ctrl_o),
        .result(ALU_result),
        .zero(ALU_zero),
        .overflow(ALU_overflow)
        );



Mux2to1 #(.size(1)) Mux_BrType(
        .data0_i(ALU_zero),
        .data1_i(~ALU_zero),
        .select_i(dec_branchType),
        .data_o(Mux_BrType_EX_o)
        );		
		
Shifter shifter( 
        .result(Shifter_result), 
        .leftRight(shift_leftRight),
        .shamt(Instr_Memory_ID_oo),
        .sftSrc(Mux_ALUSrc_o) 
        );

Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_result),
        .data2_i(Zero_Filled_o),
        .select_i(FUR_slt_o),
        .data_o(Mux_RD_EX_o)
        ); 

Data_Memory DM(
		  .clk_i(clk_i), 
        .addr_i(Mux_RD_o), 
        .data_i(Read_Data_EX_2),
        .MemRead_i(dec_Memread), 
        .MemWrite_i(dec_Memwrite), 
        .data_o(Read_Data_MEM_o)
        );

Mux3to1 #(.size(32)) Mux_WDdata_Source(
        .data0_i(Mux_RD_MEM_o),
        .data1_i(Read_Data_o),
        .data2_i(Adder1_o),
        .select_i(dec_MemToReg),
        .data_o(Mux_WD_o)
        );

/*Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_result),
        .data2_i(Zero_Filled_o),
        .select_i(FUR_slt_o),
        .data_o(Mux_RD_o)
        ); */

Shift_Left_Two #(.size(32)) SLT1(
        .data_i(Sign_Extend_o),
        .data_o(SLT1_o)
        );

Adder Adder2(
        .src1_i(Adder1_o),     
        .src2_i(SLT1_o),     
        .sum_o(Adder2_EX_o)   
        );

Mux2to1 #(.size(32)) Mux_BRSource(
        .data0_i(Adder1_IF_o),
        .data1_i(Adder2_o),
        .select_i(Mux_BrType_o & dec_branch),
        .data_o(Mux_BRSource_o)
        );

Shift_Left_Two #(.size(28)) SLT2(
        .data_i({2'b0,Instr_Memory_o[25:0]}),
        .data_o(SLT2_o)
        );

Mux2to1 #(.size(32)) Mux_JumpSource(
        .data0_i(Mux_BRSource_o),
        .data1_i({Adder1_o[31:28], SLT2_o[27:0]}),
        .select_i(dec_Jump),
        .data_o(Mux_JumpSource_o)
        );

Mux2to1 #(.size(32)) Mux_JumpType(
        .data0_i(Mux_JumpSource_o),
        .data1_i(Read_Data_1),
        .select_i(AC_Jtype_o),
        .data_o(Mux_JumpType_o)
        );
endmodule
		  


