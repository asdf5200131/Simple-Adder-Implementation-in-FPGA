`timescale 1ns / 1ps
module FSMB(clock, reset,k,s0,s1,s2,kout);
    input clock;
    input k;
    input reset;
    output s0, s1, s2;
    output kout;

    assign kout=(~s1&s2);
    
    FDCE FDCE_inst_1(
    .Q(s0),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(k));
    
    FDCE FDCE_inst_2(
    .Q(s1),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(s0));
    
     FDCE FDCE_inst_3(
    .Q(s2),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(s1));   

endmodule