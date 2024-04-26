module reg_dest_multi(rt,rd,regDst,desti);       //desti is for the output as the destination register

input [4:0]rt,rd;
input [1:0]regDst;

output [4:0] desti;

m441 multi2(rt,rd,5'd31,5'dz,regDst,desti);

endmodule

module m441 ( input [4:0]a, 
input [4:0]b, 
input [4:0]c, 
input [4:0]d, 
input [1:0]sel,
output [4:0]out); 

 assign out = sel[0] ? (sel[1] ? d : b) : (sel[1] ? c : a); 

endmodule