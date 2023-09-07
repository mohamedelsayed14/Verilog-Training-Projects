module full_adder_struct (A,B,CIN,S,C);
input A,B,CIN;
output S,C;
wire S1,C1,C2;

half_adder b1 (A,B,S1,C1);
half_adder b2 (CIN,S1,S,C2);
or (C, C1,C2);

endmodule 