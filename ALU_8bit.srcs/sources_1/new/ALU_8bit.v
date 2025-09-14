`timescale 1ns / 1ps

// 8-bit Arithmetic Logic Unit(ALU) :-
// -----------------------------------

// A Component of Central Processing Unit(CPU) which is responsible for performing all
// the Arithmetic and Logical operation.

// Arithematic Operation :-
// ------------------------
// 1. Addition
// 2. Subtraction
// 3. Multiplication
// 4. Division

// Logical Operation :-
// --------------------
// 1. NOT Logic
// 2. AND Logic
// 3. OR Logic
// 4. NAND Logic
// 5. NOR Logic
// 6. XOR Logic
// 7. XNOR Logic

// All inputs are 8-bit long.

module ALU_8bit(
    
    //inpputs
    // 8-bit inputs A and B
    input [7:0] A, B,
    
    // operation select
    input [3:0] sel,
    
    // outputs
    // 16-bit output
    output reg [15:0] result,
    
    // 8-bit remainder and quoitent
    output reg [7:0] Q, R

    );
    
    // internal wires
    wire [8:0] sum;     // addition
    wire [7:0] diff;    // subtraction
    wire [15:0] pro;    // multiplication
    wire [7:0] qt, rm;  // division -> qt = quoitent & rm = remainder
    
    //   i. Adder
    ParallelAdder pa(.A(A), .B(B), .sum(sum));
    
    //  ii. Subtractor
    ParallelSubtractor ps(.A(A), .B(B), .D(diff), .bout());
    
    // iii. Product
    Multiplier mp(.A(A), .B(B), .P(pro));
                  
    //  iv. Division
    Divider dv(.A(A), .B(B), .Q(qt), .R(rm));
               
    // ALU operation select
    always @(*) begin     
       
        Q = 8'b0;
        R = 8'b0;        
        
        case(sel)            
            4'b0000: result = {7'b0, sum};
            4'b0001: result = {8'b0, diff};
            4'b0010: result = pro;
            4'b0011: begin                        
                        result = {8'b0, qt};
                        Q = qt;
                        R = rm;                     
                     end
            4'b0100: result = {8'b0, ~A} ;
            4'b0101: result = {8'b0, A & B};
            4'b0110: result = {8'b0, A | B};
            4'b0111: result = {8'b0, ~(A & B)};
            4'b1000: result = {8'b0, ~(A | B)};
            4'b1001: result = {8'b0, (A & ~B) | (~A & B)};
            4'b1010: result = {8'b0, (A & B) | (~A & ~B)};            
            default : result = 16'b0;                    
        endcase   
         
    end                                                                
    
endmodule
