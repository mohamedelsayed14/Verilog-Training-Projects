module mux_2x1 (in1,in2,sel,out);

input  in1,in2;
input  sel;
output out;
 
assign out=sel?in2:in1; 

endmodule  