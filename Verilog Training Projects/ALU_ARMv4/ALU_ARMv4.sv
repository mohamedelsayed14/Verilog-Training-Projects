                //Mohamed Elsayed Ail Ebrahim Saad    SEC:3
module ALU_ARMv4(output logic NF,ZF,CF,VF,output logic[31:0]OUT,input logic[1:0]ALU_C,input logic[31:0]IN1,IN2);
logic CARRY;
assign {CARRY,OUT}=ALU_C[1]? (ALU_C[0]?(IN1|IN2):(IN1&IN2)) : (ALU_C[0]?(IN1+~IN2+1):(IN1+IN2));
//ALU_c=00>ADD \ALU_c=01>SUB \ALU_c=10>AND  \ALU_c=11>OR.
assign NF=OUT[31];                   //negtive flag=msb of out. 
assign ZF=&(~OUT);                  //zero flag=1 if all out bits=0.
assign CF=CARRY&(~ALU_C[1]);       //carry flag.
assign VF=(~ALU_C[1]) & (IN1[31]^OUT[31]) & (~^IN1[31]~^IN2[31]~^ALU_C[0]); //overflow flag.
endmodule
//code for test bench simulation.
module ALU_ARMv4_TESTB();
logic[31:0]a,b,r;logic[1:0]ac;logic nf,zf,cf,vf;        //inputs,out,control,flags.
ALU_ARMv4 stru_op(nf,zf,cf,vf,r,ac,a,b);               //call module alu_armv4 operations.
integer i;
initial
begin
$monitor("{ALU_CON=[%b]} {IN1=0X[%h]} {IN2=0X[%h]} {OUT=0x[%h]} {[NF=%b][ZF=(%b)][CF=(%b)][VF=(%b)]}",ac,a,b,r,nf,zf,cf,vf);
$random(5);        //generate random values
for(i=1;i<15;i=i+1)
begin
ac=$random();
a=$random();
b=$random();
#5;
end
end
endmodule 