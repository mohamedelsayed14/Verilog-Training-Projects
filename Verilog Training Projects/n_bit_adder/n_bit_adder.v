module n_bit_adder #(parameter N=4) (A,B,Cin,S,Cout);

input [N-1:0] A,B;
output [N-1:0] S;
input Cin;
output Cout;

wire [N:0] p_carry;

assign p_carry[0] = Cin;
assign Cout = p_carry[N];


genvar i;
generate
for (i = 0; i<N ; i = i+1) begin : gen_code
full_adder adderx (A[i],B[i],p_carry[i],S[i],p_carry[i+1]); 
end
endgenerate

endmodule 