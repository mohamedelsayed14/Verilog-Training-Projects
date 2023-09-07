`timescale 1ns/1ps
module edge_detector_tb ();
   reg clk , sig  ;
   wire  pe;

   edge_detector U1 (clk,sig,pe);


   //clock generation
   always
	begin
   #5
   clk = !clk ;
   end

   initial
	begin
    clk  = 0 ;
    sig <= 0 ;
     # 20
     sig = 1 ;
     # 10
     sig = 0 ;
     # 8
     sig = 1 ;
     # 15
     sig = 0 ;
     # 10
     sig = 1 ;
     #10
     sig = 0 ;
     # 20
     sig = 1 ;
     #20
    $stop ;
   end

endmodule