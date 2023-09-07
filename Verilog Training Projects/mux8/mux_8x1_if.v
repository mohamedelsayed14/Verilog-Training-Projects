//module for 8to1_mux parametrized
module mux_8x1_if (A_in,sel,en,y);

input [7:0]A_in;
input  [2:0]sel;
input  en;
output reg y;
 
always @(*) 
begin
    if(en)
	 begin
	 
	 if(sel==3'b000) begin y = A_in[0];  end
	 else if(sel==3'b000) begin y = A_in[0];  end
	 else if(sel==3'b001) begin y = A_in[1];  end
	 else if(sel==3'b010) begin y = A_in[2];  end
	 else if(sel==3'b011) begin y = A_in[3];  end
	 else if(sel==3'b100) begin y = A_in[4];  end
	 else if(sel==3'b101) begin y = A_in[5];  end
	 else if(sel==3'b110) begin y = A_in[6];  end
	 else if(sel==3'b111) begin y = A_in[7];  end
	 else  begin y =1'b0 ;  end
	 
	 end
	 else 
	 begin
	 y = 1'b0 ;
	 end
end  
endmodule