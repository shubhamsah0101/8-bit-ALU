// 8-bit Binary Parallel Adder

`timescale 1ns / 1ps

module ParallelAdder(
    
    // inputs
    input [7:0] A, B,
    
    // output
    output [8:0] sum    // extra 1-bit for carry
    );
    
    wire [8:0] cin;           // carry chain
    
    assign cin[0] = 0;       // putting initial carry = 0
    
    genvar i;
    
    generate
    
        for(i = 0; i < 8; i = i + 1) begin
        
            FullAdder fa(.x(A[i]), 
                         .y(B[i]), 
                         .z(cin[i]),
                         .sum(sum[i]),
                         .carry(cin[i+1]));
        
        end
    
    endgenerate
    
    // putting final carry to MSB of sum value
    assign sum[8] = cin[8];
    
endmodule
