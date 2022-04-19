	module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/

  wire real_a, real_b;
  assign real_a = (invertA)? ~a: a;
  assign real_b = (invertB)? ~b: b;

  wire s;
  Full_adder FA(.sum(s), .carryOut(carryOut), .carryIn(carryIn), .input1(real_a), .input2(real_b));

  assign result = (operation == 2'b00) ? ( (invertA == 0 ) ? (a & b) : ~(a | b) ) :
                  (operation == 2'b01) ? ( (invertA == 0 ) ? (a | b) : ~(a & b) ) :
                  (operation == 2'b10) ? s : less;

endmodule
