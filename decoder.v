`timescale 1ns / 1ps
module decoder( binary_in,segment_out);
    input [3:0] binary_in;
    output [6:0] segment_out;
    wire a, b, c, d;
    assign {d, c, b, a} = binary_in; 

    assign segment_out[0] = ~((~a & ~c) | (~a & d) | (~b & ~c & d) | (a & c & ~d) | (b & ~d) | (b & c));  
    assign segment_out[1] = ~((~c & ~d) | (~a & ~c) | (a & ~b & d) | (~a & ~b & ~d) | (a & b &~d));      
    assign segment_out[2] = ~((~c & d) | (c & ~d) | (a & ~b) | (~b & ~c) | (a & ~c));                    
    assign segment_out[3] = ~((a & ~b & c) | (~a & ~c & ~d) | (~b & d) | (~a & b & c) | (a & b & ~c));   
    assign segment_out[4] = ~((~a & ~c) | (~a & b) | (c & d) | (b & d));                                  
    assign segment_out[5] = ~((~a & ~b) | (~a & c) | (~c & d) | (~b & c & ~d) | (b & d));               
    assign segment_out[6] = ~((~c & d) | (b & ~c) | (~a & c & ~d) | (b & d) | (a & ~b & c));              
endmodule
