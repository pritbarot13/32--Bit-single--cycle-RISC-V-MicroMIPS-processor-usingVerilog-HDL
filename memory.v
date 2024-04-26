module memory(address,datain,dataRead,dataWrite,dataout);

input [31:0] address;
input dataRead;
input dataWrite;
input [31:0] datain;
output reg [31:0]dataout;


reg [31:0]memoryy[63:0];
 
always @(*)

begin


memoryy[0]=32'd5;   //to be commented later
memoryy[1]=32'd3;   //to be commented later
memoryy[2]=32'd0;   //to be commented later  value for jr

memoryy[3]=32'd1;
memoryy[4]=32'd2;
memoryy[5]=32'd4;

if (dataRead==1 && dataWrite==0)
begin

dataout = memoryy[address];

end

else if (dataRead==0 && dataWrite==1)
begin

memoryy[address]=datain;

end

end


endmodule

