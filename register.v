`timescale 1ns / 1ps

module register(I,load,clock,reset,R  );
    input [3:0]I;
    input load;
    input clock;
    input reset;
    output [3:0]R;
    
    assign D0=(I[0]&load)|(R[0]&~load);
    assign D1=(I[1]&load)|(R[1]&~load);
    assign D2=(I[2]&load)|(R[2]&~load);
    assign D3=(I[3]&load)|(R[3]&~load);   
         
    FDCE FDCE_inst_1(
    .Q(R[0]),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(D0));
    FDCE FDCE_inst_2(
    .Q(R[1]),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(D1));
    FDCE FDCE_inst_3(
    .Q(R[2]),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(D2));
    FDCE FDCE_inst_4(
    .Q(R[3]),
    .C(clock),
    .CE(1'b1),
    .CLR(reset),
    .D(D3));
    
endmodule
