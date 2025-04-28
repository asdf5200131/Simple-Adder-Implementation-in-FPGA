`timescale 1ns / 1ps
module tb_final;
    reg clock;             
    reg reset;              
    reg k;                   
    reg [3:0] in;             
    wire [6:0] seg_sum;       
    wire [6:0] seg_carry;   

    final uut (
        .clock(clock),
        .reset(reset),
        .k(k),
        .in(in),              
        .seg_sum(seg_sum),
        .seg_carry(seg_carry)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock; 
    end

    initial begin
        reset = 1; 
        k = 0;
        in = 4'b0000;
        #50 reset = 0; 
        #10 k = 0; 
        #50 in = 4'b1000; 
        #10 k = 1;  
        #50 k = 0; 
        #60 k = 1; in = 4'b1010; 
        #50 k = 0; 
        #40 k=1; 
        #50 k=0;
        #150
        $finish;
    end
endmodule
