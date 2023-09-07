
//testbench module for decoder truth table
`timescale 1ns/1ps
module t_table_tb ();

reg [2:0] S;
reg E ;
wire [7:0] D ;

integer i;
t_table U1 (S,E,D);

initial 
begin
    $display("S     E      D   ");
    $monitor("%b    %b     %b  ",S,E,D);

    E = 0 ;
    #10
    E = 1;
    S=0;
    for ( i=0; i<7; i = i+1)
    begin
    #10
     S = S + 1 ; 
     end

end
endmodule