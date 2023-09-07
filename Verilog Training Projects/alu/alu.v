module alu (alu_ctrl, A, B, ALU_OUT, ZERO);
input [3:0]alu_ctrl;
input [31:0]A,B;
output reg [32:0]ALU_OUT;
output ZERO;


always@(*)
begin
case(alu_ctrl)
      4'b0000: begin ALU_OUT[31:0]=A & B;     ALU_OUT[32]=1'b0;  end //bitwise and operation
		4'b0001: begin ALU_OUT[31:0]=A | B;     ALU_OUT[32]=1'b0;  end //bitwise or operation
		4'b0010: begin ALU_OUT=A + B;                          end //addition operation
		4'b0011: begin ALU_OUT[31:0]=A - B;     ALU_OUT[32]=1'b0;   end //subtraction operation	
		4'b0100: begin ALU_OUT[0]=A < B; ALU_OUT[32:1]=31'd0;  end //comparator operation  A>B =1
		4'b0101: begin ALU_OUT[31:0]=~(A | B);  ALU_OUT[32]=1'b0;  end //nor operation
		default: begin ALU_OUT=32'd0; end
endcase
end
	
assign ZERO= ~ (| ALU_OUT[31:0]);

endmodule 