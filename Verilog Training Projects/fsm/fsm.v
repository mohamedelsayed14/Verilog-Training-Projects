module fsm (clk, reset, taken, predict);
input clk, reset, taken;
output reg predict;

localparam[1:0]s0=2'b00;
localparam[1:0]s1=2'b01;
localparam[1:0]s2=2'b10;
localparam[1:0]s3=2'b11;


reg [1:0] c_state_reg;
reg [1:0] n_state_reg;


always@(posedge clk , posedge reset)
begin
if(reset)
c_state_reg <= s0;
else
c_state_reg <= n_state_reg;
end


always@(c_state_reg , taken )
begin
case(c_state_reg)
			s0:begin predict<=1'b1;
				if(taken)  n_state_reg=s0;
				else       n_state_reg=s1;
	     end
		  	s1:begin predict<=1'b1;
				if(taken)  n_state_reg=s0;
				else       n_state_reg=s2;
	     end
		  	s2:begin predict<=1'b0;
				if(taken)  n_state_reg=s3;
				else       n_state_reg=s2;
	     end
		  	s3:begin predict<=1'b0;
				if(taken)  n_state_reg=s0;
				else       n_state_reg=s2;
	     end
		  
		default:predict<=1'b1;

endcase
  		  
end

endmodule
