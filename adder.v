`timescale 1ns / 1ps
module adder (A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;
    assign Sum = A ^ B ^ Cin;              
    assign Cout = (A & B) | (Cin & (A ^ B)); 
endmodule
module adder4b (A, B, Ci, S, Co,sa,sb);
    input sa, sb; 
    input [3:0] A, B;  
    input Ci;          
    output [3:0] S;   
    output Co;         
    wire c_out_wire0, c_out_wire1, c_out_wire2;
    wire [3:0]AA,BB ;
    
    assign AA[0]=A[0]&sa;
    assign AA[1]=A[1]&sa;
    assign AA[2]=A[2]&sa;
    assign AA[3]=A[3]&sa;
    assign BB[0]=B[0]&sb;
    assign BB[1]=B[1]&sb;
    assign BB[2]=B[2]&sb;
    assign BB[3]=B[3]&sb;

    adder FA0 (.A(AA[0]), .B(BB[0]), .Cin(Ci),         .Sum(S[0]), .Cout(c_out_wire0));
    adder FA1 (.A(AA[1]), .B(BB[1]), .Cin(c_out_wire0), .Sum(S[1]), .Cout(c_out_wire1));
    adder FA2 (.A(AA[2]), .B(BB[2]), .Cin(c_out_wire1), .Sum(S[2]), .Cout(c_out_wire2));
    adder FA3 (.A(AA[3]), .B(BB[3]), .Cin(c_out_wire2), .Sum(S[3]), .Cout(Co));
endmodule

