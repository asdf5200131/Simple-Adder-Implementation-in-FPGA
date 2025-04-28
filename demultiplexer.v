`timescale 1ns / 1ps

module demultiplexer(in,select,A,B  );
    input [3:0]in;
    input select;
    output [3:0]A;
    output [3:0]B;
    
    assign A[0] = in[0] & select;
    assign A[1] = in[1] & select;
    assign A[2] = in[2] & select;
    assign A[3] = in[3] & select;
    assign B[0] = in[0] & ~select;
    assign B[1] = in[1] & ~select;
    assign B[2] = in[2] & ~select;
    assign B[3] = in[3] & ~select;
endmodule
