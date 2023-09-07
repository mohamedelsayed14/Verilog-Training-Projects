module edge_detector (clk,sig,pe);
    input  clk;
    input  sig;
    output  pe;
	 
reg sig_delay ;


always @(posedge clk )
begin
   sig_delay <= sig ; 
end

assign pe = ~sig_delay & sig ;
    
endmodule 