//module for 8to1_mux parametrized
module mux_8x1_case(A_in,sel,en,y);

input [7:0]A_in;
input  [2:0]sel;
input  en;
output reg y;
 
always @(*) 
begin
    case (en)
        1'b1:   case (sel)
                3'b000: y = A_in[0] ;
                3'b001: y = A_in[1] ;
                3'b010: y = A_in[2] ;
                3'b011: y = A_in[3] ;
                3'b100: y = A_in[4] ;
                3'b101: y = A_in[5] ;
                3'b110: y = A_in[6] ;
                3'b111: y = A_in[7] ;
                default: y = 1'b0 ;
                endcase
        1'b0:    y = 1'b0 ; 
        default: y = 1'b0 ;      
    endcase         
end  
endmodule