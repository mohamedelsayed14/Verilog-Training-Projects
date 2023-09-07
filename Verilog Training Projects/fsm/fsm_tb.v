`timescale 1ns/1ps 
module fsm_tb;
    
    reg clk, reset, taken;
    wire predict;
    
    
    fsm dut (clk, reset, taken, predict);
    
    initial begin
    $monitor("reset=%b  ,  taken=%b   ,  predect=%b ",reset, taken, predict);
        clk = 0;

        // Reset 
        reset = 1;
        #10 reset=0;
        
        
        taken=1;
         #10
         taken=0;
         #10
          taken=1;
         #10
          taken=0;
         #10
          taken=0;
         #10
          taken=0;
         #10
          taken=1;
         #10
          taken=1;


        
        
        // End simulation
        #10 $stop;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
endmodule
