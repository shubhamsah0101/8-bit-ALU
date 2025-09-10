// Full Adder using Half Adder

`timescale 1ns / 1ps

module FullAdder(

    // inputs
    input x, y, z,
    
    // outputs
    output sum, carry

    );
    
    // internal wires
    wire s1, c1, c2;
    // s1 = sum bit from first adder
    // c1 = carry bit from first adder
    // c2 = carry bit from second adder
    
    // using HalfAdder()
    HalfAdder ha1(x, y, s1, c1);
    HalfAdder ha2(s1, z, sum, c2);
    
    // final carry
    assign carry = c1 | c2;
    
endmodule
