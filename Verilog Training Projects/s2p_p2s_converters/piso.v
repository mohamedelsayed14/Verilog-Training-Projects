//PISO Converter
module piso (clk,load,p_in,s_out);
input clk,load;
input [3:0]p_in;
output s_out;

reg [3:0]data;
always @ (posedge clk)
begin
if(load)
	begin
	data<= p_in ;
	end
else
	begin
	data<= data >> 1 ; 
	end
end
assign s_out=data[0]; // // LSB out first
endmodule 