module Shifter( result, leftRight, shamt, sftSrc  );
    
  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc ;
  
  /*your code here*/ 
    assign result = (leftRight == 0) ?
	              ((shamt == 31) ? {31'b0, sftSrc[31]} : 
	               (shamt == 30) ? {30'b0, sftSrc[31:30]} : 
	               (shamt == 29) ? {29'b0, sftSrc[31:29]} : 
	               (shamt == 28) ? {28'b0, sftSrc[31:28]} :  
	               (shamt == 27) ? {27'b0, sftSrc[31:27]} : 
	               (shamt == 26) ? {26'b0, sftSrc[31:26]} : 
	               (shamt == 25) ? {25'b0, sftSrc[31:25]} : 
	               (shamt == 24) ? {24'b0, sftSrc[31:24]} : 
	               (shamt == 23) ? {23'b0, sftSrc[31:23]} : 
	               (shamt == 22) ? {22'b0, sftSrc[31:22]} : 
	               (shamt == 21) ? {21'b0, sftSrc[31:21]} : 
	               (shamt == 20) ? {20'b0, sftSrc[31:20]} : 
	               (shamt == 19) ? {19'b0, sftSrc[31:19]} : 
	               (shamt == 18) ? {18'b0, sftSrc[31:18]} : 
	               (shamt == 17) ? {17'b0, sftSrc[31:17]} : 
	               (shamt == 16) ? {16'b0, sftSrc[31:16]} : 
	               (shamt == 15) ? {15'b0, sftSrc[31:15]} : 
	               (shamt == 14) ? {14'b0, sftSrc[31:14]} : 
	               (shamt == 13) ? {13'b0, sftSrc[31:13]} : 
	               (shamt == 12) ? {12'b0, sftSrc[31:12]} : 
	               (shamt == 11) ? {11'b0, sftSrc[31:11]} : 
	               (shamt == 10) ? {10'b0, sftSrc[31:10]} : 
	               (shamt == 9) ? {9'b0, sftSrc[31:9]} : 
	               (shamt == 8) ? {8'b0, sftSrc[31:8]} :  
						(shamt == 7) ? {7'b0, sftSrc[31:7]} : 
	               (shamt == 6) ? {6'b0, sftSrc[31:6]} : 
	               (shamt == 5) ? {5'b0, sftSrc[31:5]} : 
	               (shamt == 4) ? {4'b0, sftSrc[31:4]} : 
	               (shamt == 3) ? {3'b0, sftSrc[31:3]} : 
	               (shamt == 2) ? {2'b0, sftSrc[31:2]} : 
	               (shamt == 1) ? {1'b0, sftSrc[31:1]} : 
	                          	  {1'b0, sftSrc[31:1]} 
	              ) :
	              ((shamt == 31) ? {sftSrc[0],31'b0} : 
	               (shamt == 30) ? {sftSrc[1:0],30'b0} : 
	               (shamt == 29) ? {sftSrc[2:0],29'b0} : 
	               (shamt == 28) ? {sftSrc[3:0],28'b0} :  
	               (shamt == 27) ? {sftSrc[4:0],27'b0} : 
	               (shamt == 26) ? {sftSrc[5:0],26'b0} : 
	               (shamt == 25) ? {sftSrc[6:0],25'b0} : 
	               (shamt == 24) ? {sftSrc[7:0],24'b0} : 
	               (shamt == 23) ? {sftSrc[8:0],23'b0} : 
	               (shamt == 22) ? {sftSrc[9:0],22'b0} : 
	               (shamt == 21) ? {sftSrc[10:0],21'b0} : 
	               (shamt == 20) ? {sftSrc[11:0],20'b0} : 
	               (shamt == 19) ? {sftSrc[12:0],19'b0} : 
	               (shamt == 18) ? {sftSrc[13:0],18'b0} : 
	               (shamt == 17) ? {sftSrc[14:0],17'b0} : 
	               (shamt == 16) ? {sftSrc[15:0],16'b0} : 
	               (shamt == 15) ? {sftSrc[16:0],15'b0} : 
	               (shamt == 14) ? {sftSrc[17:0],14'b0} : 
	               (shamt == 13) ? {sftSrc[18:0],13'b0} : 
	               (shamt == 12) ? {sftSrc[19:0],12'b0} : 
	               (shamt == 11) ? {sftSrc[20:0],11'b0} : 
	               (shamt == 10) ? {sftSrc[21:0],10'b0} : 
	               (shamt == 9) ? {sftSrc[22:0],9'b0} : 
	               (shamt == 8) ? {sftSrc[23:0],8'b0} :  
						(shamt == 7) ? {sftSrc[24:0],7'b0} : 
	               (shamt == 6) ? {sftSrc[25:0],6'b0} : 
	               (shamt == 5) ? {sftSrc[26:0],5'b0} : 
	               (shamt == 4) ? {sftSrc[27:0],4'b0} : 
	               (shamt == 3) ? {sftSrc[28:0],3'b0} : 
	               (shamt == 2) ? {sftSrc[29:0],2'b0} : 
	               (shamt == 1) ? {sftSrc[30:0],1'b0} : 
	                          	  {sftSrc[30:0],1'b0} 
	              );




	
endmodule