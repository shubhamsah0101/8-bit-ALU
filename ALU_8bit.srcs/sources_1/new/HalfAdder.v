// Half Adder 

`timescale 1ns / 1ps

module HalfAdder(

    // inputs
    input x, y,
    
    // outputs
    output sum, carry

    );
    
    assign sum = x ^ y;   
    assign carry = x & y;   
    
endmodule
