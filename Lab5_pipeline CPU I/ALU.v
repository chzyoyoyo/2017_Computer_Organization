module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );

//I/O ports 
input	[32-1:0] aluSrc1;
input	[32-1:0] aluSrc2;
input	[4-1:0] ALU_operation_i;

output	[32-1:0] result;
output			 zero;
output			 overflow;

//Internal Signals
wire			 zero;
wire			 overflow;
wire	[32-1:0] result;

//Main function
/*your code here*/

wire invertA;
wire invertB;
wire[1:0] operation;
wire ccout, set, lessans;

assign invertA = ALU_operation_i[3];
assign invertB = ALU_operation_i[2];
assign operation[1:0] = ALU_operation_i[1:0];

wire[31:0] cout;
  assign overflow = ((cout[31] == 0 && cout[30] == 1) || (cout[31] == 1 && cout[30] == 0))? 1 : 0;  
  assign zero = result==0 ? 1 : 0;
  ALU_1bit N1( .result(result[0]), .carryOut(cout[0]), .a(aluSrc1[0]), .b(aluSrc2[0]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(invertB), .less(lessans) ); 
  ALU_1bit N2( .result(result[1]), .carryOut(cout[1]), .a(aluSrc1[1]), .b(aluSrc2[1]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[0]), .less(1'b0) );  
  ALU_1bit N3( .result(result[2]), .carryOut(cout[2]), .a(aluSrc1[2]), .b(aluSrc2[2]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[1]), .less(1'b0) );  
  ALU_1bit N4( .result(result[3]), .carryOut(cout[3]), .a(aluSrc1[3]), .b(aluSrc2[3]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[2]), .less(1'b0) );   
  ALU_1bit N5( .result(result[4]), .carryOut(cout[4]), .a(aluSrc1[4]), .b(aluSrc2[4]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[3]), .less(1'b0) );   
  ALU_1bit N6( .result(result[5]), .carryOut(cout[5]), .a(aluSrc1[5]), .b(aluSrc2[5]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[4]), .less(1'b0) );   
  ALU_1bit N7( .result(result[6]), .carryOut(cout[6]), .a(aluSrc1[6]), .b(aluSrc2[6]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[5]), .less(1'b0) );    
  ALU_1bit N8( .result(result[7]), .carryOut(cout[7]), .a(aluSrc1[7]), .b(aluSrc2[7]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[6]), .less(1'b0) );  
  ALU_1bit N9( .result(result[8]), .carryOut(cout[8]), .a(aluSrc1[8]), .b(aluSrc2[8]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[7]), .less(1'b0) );    
  ALU_1bit N10( .result(result[9]), .carryOut(cout[9]), .a(aluSrc1[9]), .b(aluSrc2[9]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[8]), .less(1'b0) );    
  ALU_1bit N11( .result(result[10]), .carryOut(cout[10]), .a(aluSrc1[10]), .b(aluSrc2[10]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[9]), .less(1'b0) );  
  ALU_1bit N12( .result(result[11]), .carryOut(cout[11]), .a(aluSrc1[11]), .b(aluSrc2[11]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[10]), .less(1'b0) );    
  ALU_1bit N13( .result(result[12]), .carryOut(cout[12]), .a(aluSrc1[12]), .b(aluSrc2[12]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[11]), .less(1'b0) );   
  ALU_1bit N14( .result(result[13]), .carryOut(cout[13]), .a(aluSrc1[13]), .b(aluSrc2[13]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[12]), .less(1'b0) );   
  ALU_1bit N15( .result(result[14]), .carryOut(cout[14]), .a(aluSrc1[14]), .b(aluSrc2[14]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[13]), .less(1'b0) );    
  ALU_1bit N16( .result(result[15]), .carryOut(cout[15]), .a(aluSrc1[15]), .b(aluSrc2[15]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[14]), .less(1'b0) );    
  ALU_1bit N17( .result(result[16]), .carryOut(cout[16]), .a(aluSrc1[16]), .b(aluSrc2[16]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[15]), .less(1'b0) );   
  ALU_1bit N18( .result(result[17]), .carryOut(cout[17]), .a(aluSrc1[17]), .b(aluSrc2[17]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[16]), .less(1'b0) );    
  ALU_1bit N19( .result(result[18]), .carryOut(cout[18]), .a(aluSrc1[18]), .b(aluSrc2[18]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[17]), .less(1'b0) );   
  ALU_1bit N20( .result(result[19]), .carryOut(cout[19]), .a(aluSrc1[19]), .b(aluSrc2[19]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[18]), .less(1'b0) );   
  ALU_1bit N21( .result(result[20]), .carryOut(cout[20]), .a(aluSrc1[20]), .b(aluSrc2[20]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[19]), .less(1'b0) );    
  ALU_1bit N22( .result(result[21]), .carryOut(cout[21]), .a(aluSrc1[21]), .b(aluSrc2[21]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[20]), .less(1'b0) );    
  ALU_1bit N23( .result(result[22]), .carryOut(cout[22]), .a(aluSrc1[22]), .b(aluSrc2[22]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[21]), .less(1'b0) );    
  ALU_1bit N24( .result(result[23]), .carryOut(cout[23]), .a(aluSrc1[23]), .b(aluSrc2[23]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[22]), .less(1'b0) );    
  ALU_1bit N25( .result(result[24]), .carryOut(cout[24]), .a(aluSrc1[24]), .b(aluSrc2[24]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[23]), .less(1'b0) );   
  ALU_1bit N26( .result(result[25]), .carryOut(cout[25]), .a(aluSrc1[25]), .b(aluSrc2[25]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[24]), .less(1'b0) );    
  ALU_1bit N27( .result(result[26]), .carryOut(cout[26]), .a(aluSrc1[26]), .b(aluSrc2[26]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[25]), .less(1'b0) );   
  ALU_1bit N28( .result(result[27]), .carryOut(cout[27]), .a(aluSrc1[27]), .b(aluSrc2[27]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[26]), .less(1'b0) );    
  ALU_1bit N29( .result(result[28]), .carryOut(cout[28]), .a(aluSrc1[28]), .b(aluSrc2[28]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[27]), .less(1'b0) );   
  ALU_1bit N30( .result(result[29]), .carryOut(cout[29]), .a(aluSrc1[29]), .b(aluSrc2[29]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[28]), .less(1'b0) );    
  ALU_1bit N31( .result(result[30]), .carryOut(cout[30]), .a(aluSrc1[30]), .b(aluSrc2[30]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[29]), .less(1'b0) );   
  ALU_1bit N32( .result(result[31]), .carryOut(cout[31]), .a(aluSrc1[31]), .b(aluSrc2[31]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(cout[30]), .less(1'b0) );  

wire temp1, temp2;
assign temp1 = (invertA==1)? (~aluSrc1[31]) : aluSrc1[31];
assign temp2 = (invertB==1)? (~aluSrc2[31]) : aluSrc2[31];
Full_adder FA(set, ccout, cout[30], temp1, temp2);
 
assign lessans = (overflow==1)?~set:set;

endmodule
