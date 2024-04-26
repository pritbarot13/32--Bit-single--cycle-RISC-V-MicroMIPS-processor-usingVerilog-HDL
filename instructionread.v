`timescale 1ns/1ns

//verification done

module instructionread(clk,pc,instruction,currentpc/*,opcode*/ );

output reg[31:0]currentpc;
output reg [31:0] instruction;
//output [5:0] opcode;
input [31:0] pc;
input clk;
//reg [31:0] instructions[1023:0];
//reg [31:0]pcactual;
integer i;

//file reading
reg [31:0]read_data[31:0];

initial 
begin
//$readmemb("D:/Quartus programmes/Computer architecture/Special Assignment/instruction read file handling/instructionsss.txt",read_data);
end

//reg [31:0]temp1,temp2,temp3;


//initial 
//begin

//instructions[0]=8'b00111101;   //addi
//instructions[1]=8'b00000000;
//instructions[2]=8'b00010000;
//instructions[3]=8'b00100001;
//
//instructions[4]=8'b00100010;	 //sub
//instructions[5]=8'b01000000;
//instructions[6]=8'b00010001;
//instructions[7]=8'b00000010;
//
//
//instructions[8]=8'b00001000;		//beq
//instructions[9]=8'b00000000;
//instructions[10]=8'b00110010;
//instructions[11]=8'b00010010;
//
////instructions[12]=8'b00001100;		//bne   will jump to the jump wala instruction if not equal
////instructions[13]=8'b00000000;
////instructions[14]=8'b00110010;
////instructions[15]=8'b00010110;
//
//instructions[12]=8'b00000100;		//bne   will jump to the jump and link wala instruction if not equal
//instructions[13]=8'b00000000;
//instructions[14]=8'b00110010;
//instructions[15]=8'b00010110;
//
//instructions[16]=8'b00000000;		// load			100011  10000  10001  0000000000000001
//instructions[17]=8'b00000000;
//instructions[18]=8'b00010001;
//instructions[19]=8'b10001110;
//
//instructions[20]=8'b00001000;   //jump and link
//instructions[21]=8'b00000000;
//instructions[22]=8'b11100000;
//instructions[23]=8'b00000011;
//
//instructions[24]=8'b00000100;    //jump
//instructions[25]=8'b00000000;
//instructions[26]=8'b00000000;
//instructions[27]=8'b00001000;
//

//end

always@(posedge clk)
begin

currentpc=pc;
//temp1=pc+32'd3;
//temp2=pc+32'd2;
//temp3=pc+32'd1;
//pcactual=pc/i;
//instruction={instructions[pc+32'd3],instructions[pc+32'd2],instructions[pc+32'd1],instructions[pc]};
//assign opcode=instruction[31:26];
//$readmemb("D:/Quartus programmes/Computer architecture/Special Assignment/instruction read file handling/instructionsss.txt",read_data);

instruction=read_data[pc/4];


end

endmodule







//
//
//module tb;
//
//wire [31:0]instructionn;
//reg [31:0]pc;
//
//
//Instrc_read DUT(pc,instructionn);
//
//initial 
//begin
//pc=32'd4;
//
//#40
//pc=32'd8;
//
//end
//
//endmodule
//


