// 8-bit Parallel Subtractor :-

`timescale 1ns / 1ps

module ParallelSubtractor(
    
    // inputs
    input [7:0] A, B,
    
    // outputs
    output [7:0] D,
    output bout
    
    );
    
    wire [8:0] bin;
    
    assign bin[0] = 1;
    
    genvar i;
    
    generate
        
        for(i = 0; i < 8; i = i + 1) begin
        
            FullAdder fa(.x(A[i]),
                         .y(~B[i]),
                         .z(bin[i]),
                         .sum(D[i]),
                         .carry(bin[i+1]));
        
        end
    
    endgenerate
    
    // if bout = 0 -> +ve else -ve
    assign bout = ~bin[8];  // borrow
    
endmodule
