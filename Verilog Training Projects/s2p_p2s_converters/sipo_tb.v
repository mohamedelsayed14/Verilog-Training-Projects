`timescale 1ns/1ps
module sipo_tb;
    
    reg clk, reset, s_in;
    wire [3:0] p_out;
    
    sipo U1 (clk,reset,s_in,p_out);
    
    initial begin
        clk = 0;
        reset = 1;
        s_in = 0;
    



        // Reset 
        #12 reset = 0;
        
        // Test 1: Serial input = 1010
        #10 s_in = 0;
        #10 s_in = 1;
        #10 s_in = 0;
        #10 s_in = 1;
        
        // Test 2: Serial input = 0110
        #10 s_in = 0;
        #10 s_in = 1;
        #10 s_in = 1;
        #10 s_in = 0;
        
        #10 $stop;
    end
    
       always begin
        #5 clk = ~clk;
        end  
endmodule
