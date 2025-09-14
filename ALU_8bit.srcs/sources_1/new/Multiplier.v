`timescale 1ns / 1ps

module Multiplier(

    // inputs
    input  [7:0] A, B,
    
    // output
    output [15:0] P
    
);

    // Partial products
    wire [15:0] p [7:0];  // 8 partial products 
    //wire [15:0] p0, p1, p2, p3, p4, p5, p6, p7;
    
    wire [15:0] sum [7:0]; // sum array to accumulate partial products
    //wire [15:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7;

    genvar i;

    // Generate partial products
    generate
    
        for (i = 0; i < 8; i = i + 1) begin // partial product
        
            assign p[i] = (A & {8{B[i]}}) << i;  // shift left by i
            
        end
        
    endgenerate

    // Accumulate partial sums
    assign sum[0] = p[0];  // first partial product

    generate
    
        for (i = 1; i < 8; i = i + 1) begin // sum of partial product
        
            assign sum[i] = sum[i-1] + p[i];  // add each partial product
            
        end
        
    endgenerate

    // final product
    assign P = sum[7];  

endmodule
