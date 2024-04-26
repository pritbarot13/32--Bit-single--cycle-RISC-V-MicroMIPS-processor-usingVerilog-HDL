module Processor(clk,reset);

input clk,reset;
//wire [31:0] pc;
wire [31:0] instruction;
wire [5:0]op,fn;
wire [4:0]rs,rt,rd;
wire [15:0]imm;
wire regWrite,ALUSrc,AddSub,dataRead,dataWrite;
wire [1:0] regDst,regIncSrc,LogicFn,FnClass,Brtype,PCSrc;
wire [4:0]desti;
wire [31:0]rsvalue,rtvalue,rttemp;
wire parity;
wire ALUOvfl;

wire [31:0]syscall;
wire [31:0]newpc;
wire [31:0]out;
wire [31:0]incrpc;


wire [31:0]dataOut;
wire [25:0]jta;
wire [31:0]currentpc;


assign syscall=32'b0;
assign jta=instruction[25:0];

instructionread instructionreadd(clk,newpc,instruction,currentpc); //done

instr_cache Instruction_cache(instruction,op,fn,rs,rt,rd,imm);   //done

Control Control_system(op,fn,regWrite,regDst,regIncSrc,ALUSrc,AddSub,LogicFn,FnClass,dataRead,dataWrite,Brtype,PCSrc);   //done

reg_dest_multi destination_selection_multiplexer(rt,rs,regDst,desti);    //done 

regfile register_file(rs,rt,desti,imm,regWrite,ALUSrc,dataOut,rsvalue,rtvalue,rttemp);    // done

ALU ALU_unit(rsvalue,rtvalue,AddSub,LogicFn,FnClass,out,ALUOvfl,parity);   //done
//memory block7(address,datain,dataRead,dataWrite,dataout);                //pending

datacache Datacache_block(out,rttemp,dataRead,dataWrite,incrpc,regIncSrc,dataOut);    // 

nextInstrc Next_instruction(reset,currentpc,Brtype,rsvalue,rttemp,jta,PCSrc,syscall,newpc,incrpc);


endmodule
