//verification done

module Control(/*rs,rt,rd,imm,pc,*/ opcode,func,regWrite,regDst,regInSrc,ALUSrc,AddSub,LogicFn,FnClass,DataRead,DataWrite,Brtype,PCSrc);

input [5:0] opcode,func;
output reg regWrite,ALUSrc,AddSub,DataRead,DataWrite;
output reg [1:0] regDst,regInSrc,LogicFn,FnClass,Brtype,PCSrc;

//reg [4:0] rs,rt,rd;
//reg [15:0] imm;
//reg [31:0] pc;

always @(*)
begin

if ({opcode,func}==12'b000000100000)   // add
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'b0;
LogicFn=2'bz;
FnClass=2'b10;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;


end

if ({opcode,func}==12'b000000100010)   //subtract
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'b1;
LogicFn=2'bz;
FnClass=2'b10;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000101010)   //set less than
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'b1;
LogicFn=2'bz;
FnClass=2'b01;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000100100)   //AND
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'bz;
LogicFn=2'b00;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000100101)   //OR
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'bz;
LogicFn=2'b01;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000100110)   //xor
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'bz;
LogicFn=2'b10;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000100111)   //nor
begin
regWrite=1'b1;
regDst=2'b01;
regInSrc=2'b01;
ALUSrc=1'b0;
AddSub=1'bz;
LogicFn=2'b11;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if ({opcode,func}==12'b000000001000)   //jump register
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'bz;
PCSrc=2'b10;

end

if ({opcode,func}==12'b000000001100)   //system call
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'bz;
PCSrc=2'b11;

end

if (opcode==6'b001111)   //load upper immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'b00;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b001000)   //add immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'b0;
LogicFn=2'bz;
FnClass=2'b10;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b001010)   //set less than immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'b1;
LogicFn=2'bz;
FnClass=2'b01;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b001100)   //AND immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'bz;
LogicFn=2'b00;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b001101)   //OR immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'bz;
LogicFn=2'b01;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b0;
PCSrc=2'b00;

end

if (opcode==6'b001110)   //XOR immediate
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b01;
ALUSrc=1'b1;
AddSub=1'bz;
LogicFn=2'b10;
FnClass=2'b11;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b100011)   //Load word
begin
regWrite=1'b1;
regDst=2'b00;
regInSrc=2'b00;
ALUSrc=1'b1;
AddSub=1'b0;
LogicFn=2'bz;
FnClass=2'b10;
DataRead=1'b1;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b101011)   //store word
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'b1;
AddSub=1'b0;
LogicFn=2'bz;
FnClass=2'b10;
DataRead=1'b0;
DataWrite=1'b1;
Brtype=2'b00;
PCSrc=2'b00;

end

if (opcode==6'b000010)   //jump
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'bz;
PCSrc=2'b01;

end

if (opcode==6'b000001)   //branch on less than 0
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b11;
PCSrc=2'b00;

end

if (opcode==6'b000100)   //branch on equal
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b01;
PCSrc=2'b00;

end

if (opcode==6'b000101)   //branch on not equal
begin
regWrite=1'b0;
regDst=2'bz;
regInSrc=2'bz;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b10;
PCSrc=2'b00;

end

if (opcode==6'b000011)   //jump and link
begin
regWrite=1;
regDst=2'b10;
regInSrc=2'b10;
ALUSrc=1'bz;
AddSub=1'bz;
LogicFn=2'bz;
FnClass=2'bz;
DataRead=1'b0;
DataWrite=1'b0;
Brtype=2'b00;
PCSrc=2'b01;

end


end

endmodule

