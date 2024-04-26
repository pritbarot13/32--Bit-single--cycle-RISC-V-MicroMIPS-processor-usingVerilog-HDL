module datacache(dataaddr,datain,dataRead,dataWrite,pcincr,regIncSrc,dataOut);
input [31:0]datain;
input [31:0]dataaddr;
input dataRead;
input dataWrite;
input [1:0] regIncSrc;
input [31:0] pcincr;

output reg [31:0]dataOut;


wire [31:0] datafromreg;           //data from memory for load operation

memory mem3(dataaddr,32'dz,1,0,datafromreg);

always @(*)

begin

if (dataRead==1'b0 && dataWrite==1'b0 && regIncSrc==2'b01)
begin
dataOut=dataaddr;
end

else if (dataRead==1'b1  && dataWrite==1'b0  && regIncSrc==2'b00)
begin
dataOut=datafromreg;
end

else if (dataRead==0 && dataWrite==0 && regIncSrc==2'b10)
begin
dataOut=pcincr;
end

else if (dataRead==0 && dataWrite==1 && regIncSrc==2'bz)
begin
dataOut=dataaddr;
end

end

endmodule
//memory(address,datain,dataRead,dataWrite,dataout);