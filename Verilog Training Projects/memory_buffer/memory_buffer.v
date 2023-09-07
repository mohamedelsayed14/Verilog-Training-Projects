//module for memory buffer
module memory_buffer (clk,rst,w,r,data_in,data_out);
input	clk,rst,w,r;
input	[15:0] data_in;
output reg 	[15:0] data_out;

reg[15:0] memory	[0:7];
reg[2:0]	r_pointer;
reg[2:0]	w_pointer;



//for writing
always @ (posedge clk, negedge rst)
  begin
    if (!rst)
	  begin
		    w_pointer <= 3'b000;
	  end
	else if (w)
	  begin
		memory[w_pointer] <= data_in;
		w_pointer <= w_pointer + 3'd1 ;
	  end
	 else
		begin 
		 w_pointer <= w_pointer;
		end
  end


//for reading
always @ (posedge clk, negedge rst)
  begin
    if (!rst)
	  begin
		  r_pointer <= 3'b000;
	  end
	else if (r)
	  begin
		//data_out  <= memory[r_pointer];
		r_pointer <= r_pointer + 3'd1 ;
	  end
	 else
		begin 
		 //data_out <= 16'bz;
		 r_pointer <= r_pointer;
		end	
  end
  assign data_out  = r? memory[r_pointer]:16'd0 ;

endmodule 