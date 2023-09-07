//text bench for up down counter
`timescale 1ns/1ps
module u_d_counter ();

   reg clk , reset , mode ;
   wire [3:0] q ;

   u_d_counter U1 (clk,reset,mode,q);

   //clock generation
   clk=0;
   always
    begin
       #5
       clk = !clk ;
    end

   initial
    begin
    reset = 1 ;
    mode = 0 ;
    # 10
    reset = 0 ;
    #100
    mode = 1 ;
    #50
    $stop ;
   end

endmodule