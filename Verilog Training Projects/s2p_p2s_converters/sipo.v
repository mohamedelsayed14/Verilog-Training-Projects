//SIPO Converter
module sipo (clk,reset,s_in,p_out);
input clk,reset;
input s_in; 
output [3:0]p_out;

reg [3:0]data;
always @ (posedge clk)
begin
if(reset)
	begin
	data<=4'd0 ;
	end
else
	begin
	data<= {s_in,data[3:1]}; // LSB input first
	end
end
assign p_out=data;
endmodule 