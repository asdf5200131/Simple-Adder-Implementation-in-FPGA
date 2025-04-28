`timescale 1ns / 1ps
module FSM(clock, reset, kout, select, load, n0,n1,s0,s1,sa,sb);
    input clock;
    input reset;
    input kout;
    output select;
    output load;
    output sa, sb;
    output n0, n1, s0, s1;
    wire n0,n1,s0,s1;
    
    assign n1=(~kout&s1 | s1&~s0 | ~s1&s0&kout);
    assign n0=(s0^kout);
    assign select=s1^s0;
    assign load=~s1&s0;
    assign sa=~s0 |~s1;
    assign sb=(~s1&~s0 | s1&s0);
    
    
    FDCE#
    (.INIT(1'b1) )FDCE_inst_1(
    .Q(s0),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(n0));
    
    FDCE FDCE_inst_2(
    .Q(s1),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(n1));
    
endmodule
