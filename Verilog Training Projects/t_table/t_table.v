//module for decoder truth table
module t_table (S,E,D);
input [2:0] S ;
input  E;
output reg [7:0] D;

always @(*) 
begin
    case (E)
        1'b1:   case (S)
                3'b000: D = 8'd1 ;
                3'b001: D = 8'd2 ;
                3'b010: D = 8'd4 ;
                3'b011: D = 8'd8 ;
                3'b100: D = 8'd16 ;
                3'b101: D = 8'd32;
                3'b110: D = 8'd64;
                3'b111: D = 8'd128 ;
                default: D = 8'd0 ;
                endcase
        1'b0:    D = 8'd0 ; 
        default: D = 8'd0 ;      
    endcase         
end  
endmodule