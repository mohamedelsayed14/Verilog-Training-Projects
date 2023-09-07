module para_carry_adder #(parameter N=4) (A,B,Cin,S,Cout);

input [N-1:0] A,B;
output [N-1:0] S;
input Cin;
output Cout;

wire [N:0] p_0_carry,p_1_carry;
wire [N-1:0] p_0_s,p_1_s;


assign p_0_carry[0] = 1'b0;
assign p_1_carry[0] = 1'b1;


assign Cout = Cin ? p_1_carry[N]: p_0_carry[N]; 

genvar i;
generate
for (i = 0; i<N ; i = i+1) begin : gen_code

full_adder adder_0_x (A[i],B[i],p_0_carry[i],p_0_s[i],p_0_carry[i+1]);
full_adder adder_1_x (A[i],B[i],p_1_carry[i],p_1_s[i],p_1_carry[i+1]); 
mux_2x1 mux (p_0_s[i],p_1_s[i],Cin,S[i]); 

end
endgenerate

endmodule 