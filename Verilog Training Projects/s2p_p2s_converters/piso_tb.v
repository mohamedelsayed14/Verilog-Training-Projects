`timescale 1ns/1ps
module piso_tb ();

   reg clk , load  ;
   reg [3:0] p_in ;
   wire s_out ;

   piso U1 (clk,load,p_in,s_out);

   //clock generation
   initial clk  = 0 ;
   always begin
   #5 clk = !clk ;
   end

   initial
	begin
    p_in = 4'd0;
    load = 0 ;
    # 10
    p_in = 4'd5;
    load = 1 ;
    #10
    load = 0 ;
    #60
    p_in = 4'd10;
    load = 1 ;
    #10
    load = 0 ;
    #60
    $finsh ;
   end
endmodule