module full_adder (A,B,CIN,S,C);
input A,B,CIN;
output S,C;

assign {C,S} = A + B + CIN ;

endmodule 