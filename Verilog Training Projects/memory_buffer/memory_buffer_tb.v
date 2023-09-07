`timescale 1ns/1ps 
module memory_buffer_tb;
    
    reg clk, rst, w, r;
    reg [15:0] data_in;
    wire [15:0] data_out;
    
    memory_buffer uut (clk,rst,w,r,data_in,data_out);
    
    initial begin
    $monitor("reset=%h  ,  w=%h   ,  r=%h  ,  datain=%h   ,  dataout=%h",rst,w,r,data_in,data_out);
        clk = 0;
        rst = 0;
        w = 0;
        r = 0;
        data_in = 16'b0;
        
        // Reset 
        #10 rst = 1;
        
        // Test 1: Write data to memory
        #10 w = 1;
            data_in = 16'hffaa;
        #10 w = 1;
            data_in = 16'h1100;
        #10 w = 1;
            data_in = 16'haaaa;
        #10 w = 0;
        
        // Test 2: Read data from memory
        #10 r = 1;
        #10 r = 1;
        #10 r = 1;
        #10 r = 0;
        
        
        // End simulation
        #10 $stop;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
endmodule
