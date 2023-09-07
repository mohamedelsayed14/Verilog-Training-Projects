//coin_val=1  when input 10 cent  && coin_val=0  when input 2 cent
//a pencile =  6 cent
//extra money=1 when remender_out=2 cent && extra money=0 when no extra money

module vending_machine (clk, reset, coin_in_en, coin_val, pencile_out, money_out, extra_money);
input clk, reset, coin_in_en, coin_val;
output reg pencile_out, money_out, extra_money;

localparam[2:0]s_0c=3'b000;
localparam[2:0]s_2c=3'b001;
localparam[2:0]s_r_2c=3'b010;
localparam[2:0]s_4c=3'b011;
localparam[2:0]s_6c=3'b100;
localparam[2:0]s_10c=3'b101;
localparam[2:0]s_12c=3'b110;
localparam[2:0]s_14c=3'b111;//states

reg [2:0] c_state_reg;
reg [2:0] n_state_reg;


always@(posedge clk , negedge reset)
begin
if(~reset)
c_state_reg <= s_0c;
else
c_state_reg <= n_state_reg;
end


always@(c_state_reg , coin_in_en , coin_val)
begin
case(c_state_reg)
	s_0c:begin pencile_out<=1'b0; money_out<=1'b0; extra_money<=1'b0;
				  if(~coin_in_en)  n_state_reg=s_0c;
				  else
						if(coin_val) n_state_reg=s_10c;
		   			else         n_state_reg=s_2c;				
	     end
		  
	s_2c:begin pencile_out<=1'b0; money_out<=1'b0; extra_money<=1'b0;
				  if(~coin_in_en)  n_state_reg=s_2c;
				  else
						if(coin_val) n_state_reg=s_12c;
		   			else         n_state_reg=s_4c;				
	     end
 		  
	s_r_2c:begin pencile_out<=1'b0; money_out<=1'b1; extra_money<=1'b1;
				    n_state_reg=s_0c;	
	       end
			 
	s_4c:begin pencile_out<=1'b0; money_out<=1'b0; extra_money<=1'b0;
				  if(~coin_in_en)  n_state_reg=s_4c;
				  else
						if(coin_val) n_state_reg=s_14c;
		   			else         n_state_reg=s_6c;				
	     end

	s_6c:begin pencile_out<=1'b1; money_out<=1'b0; extra_money<=1'b0;
				  n_state_reg=s_0c;		
	     end 		  

	s_10c:begin pencile_out<=1'b1; money_out<=1'b1; extra_money<=1'b1;
				   n_state_reg=s_r_2c;				
	     end
		  
	s_12c:begin pencile_out<=1'b1; money_out<=1'b0; extra_money<=1'b0;
				   n_state_reg=s_6c;	
	     end

	s_14c:begin pencile_out<=1'b1; money_out<=1'b1; extra_money<=1'b1;
				   n_state_reg=s_6c;	
	     end

 default:begin pencile_out<=1'b0; money_out<=1'b0; extra_money<=1'b0;
				   n_state_reg=s_0c;	
        end
endcase
  		  
end

endmodule
