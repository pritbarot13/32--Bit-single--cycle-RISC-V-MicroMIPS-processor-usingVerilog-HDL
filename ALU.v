module ALU(rsvalue,in_multi,addsub,LogicFn,FnClass,out,ALUOvfl,zeroflag);
//parameter k=32;

input [31:0] rsvalue,in_multi;
input addsub;    // 0: add,sub  1,2: logic    3,4: multi
input [1:0] LogicFn;
input [1:0] FnClass;

output [31:0]out;
output ALUOvfl;
output zeroflag;

wire [31:0] y;
wire [31:0]msb;
wire [31:0]logicout;       //output of the logic block
wire [31:0]arithout;       //output of the arithmetic block
wire [31:0]shifted;

genvar i;

generate for (i=0;i<32;i=i+1)
begin: as_loop

xor(y[i],addsub,in_multi[i]);

end
endgenerate

assign arithout=rsvalue+y+addsub;  //3rd input to the multiplexer

//overflow flag
assign ALUOvfl=(rsvalue[31] & y[31] & ~out[31]) | (~rsvalue[31] & ~y[31] & out[31]);

//zero flag
nor (zeroflag,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],out[16],out[17],out[18],out[19],out[0],out[20],out[21],out[22],out[23],out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31]);

assign msb={31'b0,out[31]};       // second input to the multiplexer

//logic block
assign logicout=(LogicFn==2'b00)? (rsvalue & in_multi):(32'dz);
assign logicout=(LogicFn==2'b01)? (rsvalue | in_multi):(32'dz);
assign logicout=(LogicFn==2'b10)? (rsvalue ^ in_multi):(32'dz);
assign logicout=(LogicFn==2'b11)? ~(rsvalue | in_multi):(32'dz);


//selecting output line
m41 multi3(shifted,msb,arithout,logicout,FnClass,out);     


endmodule


//multiplexer module
module m41 ( input [31:0]a, 
input [31:0]b, 
input [31:0]c, 
input [31:0]d, 
input [1:0]sel,
output [31:0]out); 

 assign out = sel[0] ? (sel[1] ? d : b) : (sel[1] ? c : a); 

endmodule

