// 8-bir Divider

`timescale 1ns / 1ps

module Div4bit(
    
    // inputs
    input [7:0] A, B,          // Dividend, Divisor
    
    //outputs
    output reg [7:0] Q, R      // Quotient, Remainder
    
    );

    reg [10:0] rem;             // extra bit for sign
    integer i;

    always @(*) begin
        rem = 0;               // remainder starts at 0
        Q = 0;

        // Perform restoring division
        for (i = 7; i >= 0; i = i - 1) begin
            // Shift remainder left and bring down the current dividend bit
            rem = {rem[7:0], A[i]};   

            // Subtract divisor
            rem = rem - {1'b0, B};

            if (rem[8] == 1) begin
                // If remainder is negative, restore
                rem = rem + {1'b0, B};
                Q[i] = 0;
            end else begin
                Q[i] = 1;
            end
        end
        
        // Final remainder
        R = rem[7:0];   
    end
endmodule
