`timescale 1ns/1ns

module regfile_file(rs,rt,multi_inp,imm,regWrite,ALUSrc,dataout,rsvalue,rtvalue,rttemp);              //multi_inp is input from the multiplexer
input [4:0]rs,rt,multi_inp;
//input [1:0]regDst;
input regWrite;
input [31:0]dataout;
input ALUSrc;
input [15:0]imm;

output [31:0]rttemp;
output [31:0] rsvalue,rtvalue;

integer write_data;

//reg [31:0]rsaddress,rtaddress
reg [31:0] gprs[31:0];        //32 general purpose registers

reg [31:0] read_data[31:0];

reg sign;
reg [31:0]signextend;

wire [31:0]rss;
wire [31:0]rtt;
wire [31:0]rttemp;


assign rss=gprs[rs];	
assign rtt=gprs[rt];

memory me(rss,32'bz,1,0,rsvalue);
memory me2(rtt,32'bz,1,0,rttemp);      

assign rtvalue=(ALUSrc==0)? rttemp:{imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm[15],imm};
//gprs[multi_inp]= (regWrite==1)? dataout : gprs[multi_inp];   //write to the register address

initial
begin 

//$readmemb("D:/Quartus programmes/Computer architecture/Special Assignment/regfile using file handling/gprs.txt",read_data);

#10;
read_data[multi_inp]=gprs[multi_inp];
write_data=$fopen("D:/Quartus programmes/Computer architecture/Special Assignment/regfile using file handling/gprs.txt","w");
$fdisplay(write_data,read_data);
#10;
$fclose(write_data);

end


always@(*)
//
begin
//	
//rsvalue=gprs[rs];

//fork
//$readmemb("D:/Quartus programmes/Computer architecture/Special Assignment/regfile using file handling/gprs.txt",read_data);
//
//#10;
//read_data[multi_inp]=gprs[multi_inp];
//write_data=$fopen("D:/Quartus programmes/Computer architecture/Special Assignment/regfile using file handling/gprs.txt","w");
//$fdisplay(write_data,read_data);
//#10;
//$fclose(write_data);
//
//join

gprs[rs]= 32'd0;   //to be commented later
gprs[rt]=32'd1;    //to be commented later

gprs[multi_inp]= (regWrite==1)? dataout : gprs[multi_inp];   //write to the register address

gprs[5'd31]=32'd2;      //in 2nd locn, we have stored the return value in memory

//
//if (ALUSrc==0)
//rtvalue=gprs[rt];
//
//else
//begin
//sign=imm[15];
//signextend={sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign};
//rtvalue={signextend,imm};
//
//end
//
end

endmodule
