`timescale 1ns/1ps
module rom_mem_tb ();

reg		[3:0]	address;
reg 			clk;
wire	[7:0]	data;

rom_mem rom_inst (address,clk,data);

integer i;
initial
 begin
    $display("address  dout");
    $monitor("  %d      %h",address,data);
    clk=0;
    #3
    for ( i=0; i<16; i = i+1)
    begin
     address = i;
	 #10;
     end
  
   #200
   $stop;
 end

   //clock generation
   always
    begin
       #5
       clk = !clk ;
    end

endmodule 