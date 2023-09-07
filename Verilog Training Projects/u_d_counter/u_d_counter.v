//module up down counter
module u_d_counter (clk,reset,mode,q);
input clk, reset, mode; //mode=0 count_Up ,mode=1 count_down
output reg [3:0]q;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
        begin
        q <= 4'd0 ;
        end
    else if(!mode) 
        begin
        q <= q + 4'd1 ;
        end 
    else 
        begin
        q <= q - 4'd1 ;
        end
   end

endmodule 