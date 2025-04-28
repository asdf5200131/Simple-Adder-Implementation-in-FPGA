`timescale 1ns / 1ps
module final(
    input clock,
    input reset,
    input k,
    input [3:0]in,              
    output [6:0] seg_sum,
    output [6:0] seg_carry,
    output Co        
);
    wire select, load;       
    wire [3:0] A, B, R;        
    wire [3:0] S;
    wire sa,sb;
 
    FSMB fsmb_inst (
        .clock(clock),
        .reset(reset),
        .kout(kout),
        .k(k)
    );

    FSM fsm_inst (
        .clock(clock),
        .reset(reset),
        .kout(kout),
        .select(select),
        .load(load),
        .sa(sa),
        .sb(sb)
    );

    demultiplexer demux_inst (
        .in(in),               
        .select(select),
        .A(A),
        .B(B)
    );

    register reg_inst (
        .I(A),               
        .load(load),
        .clock(clock),
        .reset(reset),
        .R(R)                
    );


    adder4b adder_inst (
        .A(R),            
        .B(B),                
        .Ci(1'b0),            
        .S(S),                 
        .Co(Co),
        .sa(sa),
        .sb(sb)            
    );

    decoder seg_sum_inst (
        .binary_in(S),         
        .segment_out(seg_sum)
    );

    decoder seg_carry_inst (
        .binary_in({3'b000, Co}), 
        .segment_out(seg_carry)
    );

endmodule
