module instr_cache(instruction,op,fn,rs,rt,rd,imm);

input [31:0]instruction;
output [5:0]op,fn;
output [4:0]rs,rt,rd;
output [15:0]imm;

assign op=instruction[31:26];
assign fn=instruction[5:0];
assign rs=instruction[25:21];
assign rt=instruction[20:16];
assign rd=instruction[15:11];
assign imm=instruction[15:0];

endmodule

//verified