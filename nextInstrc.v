module nextInstrc(reset,pc,BrType,rs,rt,jta,PCSrc,syscall,newpc,incrpc);


//input [4:0] rs,rt;                    // rs and rt registers
input reset;
input [1:0] BrType, PCSrc;
input [31:0] pc;
input [25:0]jta;
input [31:0]syscall;
input [31:0] rs,rt;                    // value stored in rs,rt

output reg [31:0] newpc;
output reg [31:0]incrpc;

reg [29:0]temppc32;
reg [29:0]Pc32;
reg [29:0]tempincrpc;

reg sign;
reg [15:0]signextend;
 

always @(*)
begin

if (reset==1'b1)
begin
newpc=32'b0;
end

else
begin

Pc32=pc[31:2];
tempincrpc=Pc32+1;
incrpc={tempincrpc,pc[1:0]};

	if (PCSrc==2'b00)
	begin
	
		if (BrType==2'b00)
		begin
			temppc32=Pc32+1;
			newpc={temppc32,pc[1:0]};
		end

		else if (BrType==2'b11)
		begin

			if (rs<0)
			begin
			sign=jta[15];
			signextend={sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign};
			temppc32=pc+{signextend,jta[15:0]};
		
			newpc={Pc32,pc[1:0]};
		
			end
			
			else
			begin
			//newpc=pc32+1;
			temppc32=Pc32+1;
			newpc={temppc32,pc[1:0]};
			end
			
		end
		
		else if (BrType==2'b01)
		begin

			if (rs==rt)
			begin
			sign=jta[15];
			signextend={sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign};
			//newpc=pc+{signextend,jta[15:0]};
			newpc=pc+{signextend,jta[15:0]};
			//newpc={Pc32,pc[1:0]};
			end
			
			else
			//newpc=Pc32+1;
			begin
			temppc32=Pc32+1;
			newpc={temppc32,pc[1:0]};
			end
			
		end

		else if (BrType==2'b10)
		begin

			if (rs!=rt)
			begin
			sign=jta[15];
			signextend={sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign};
			//newpc=pc+{signextend,jta[15:0]};	
			newpc=pc+{signextend,jta[15:0]};
			//newpc={temppc32,pc[1:0]};
			end
	
			else
			//newpc=Pc32+1;
			begin
			temppc32=Pc32+1;
			newpc={temppc32,pc[1:0]};
			end
		end
	end

	else if (PCSrc==2'b01)
	begin
		//newpc={pc[31:28],jta};
		newpc={pc[31:28],jta};
		//newpc={Pc32,pc[1:0]};
	end

	else if (PCSrc==2'b10)
	begin
		//newpc=rs;
		newpc={rs[31:2],pc[1:0]};
	end

	else if (PCSrc==2'b11)
	begin
		newpc={syscall,pc[1:0]};
	end


end

end

endmodule
