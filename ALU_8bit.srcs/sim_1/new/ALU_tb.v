// Test cases for Arithmetic Logic Unit(ALU) :-

`timescale 1ns / 1ps

module ALU_tb;

    reg [7:0] A, B;
    reg [3:0] sel;
    
    wire [15:0] result;
    wire [7:0] Q, R;
    
    ALU_8bit uut(.A(A), .B(B), .sel(sel), .result(result), .Q(Q), .R(R));
    
    initial begin
    
        $display("\n=============== 8-bit ALU ===============\n");
        
//        // test case - 1
        A = 8'd25;  B = 8'd7;   #5
        $display("Test case - 1 : A = %b(%0d) \t B = %b(%0d)\n", A, A, B, B);
        
        $display("Arithematic Operation :- \n");
        // addition
        sel = 4'b0000;  #10;    $display("Addition       = %b(%0d)", result, result);
        
        // subtraction
        sel = 4'b0001;  #10;    $display("Subtraction    = %b(%0d)", result, result);
        
        // multiplication
        sel = 4'b0010;  #10;    $display("Multiplication = %b(%0d)", result, result);
        
        // division
        sel = 4'b0011;  #10;    $display("Division : Quoitent = %b(%0d) \t Remainder = %b(%0d) \n", Q, Q, R, R);
        
        $display("Logical Operation :- \n");
        // not
        sel = 4'b0100;   #10;   $display("NOT LOGIC  = %b(%0d)", result, result);
        
        // and
        sel = 4'b0101;   #10;   $display("AND LOGIC  = %b(%0d)", result, result);
        
        //or
        sel = 4'b0110;   #10;   $display("OR LOGIC   = %b(%0d)", result, result);
        
        // nand
        sel = 4'b0111;   #10;   $display("NAND LOGIC = %b(%0d)", result, result);
        
        // nor
        sel = 4'b1000;   #10;   $display("NOR LOGIC  = %b(%0d)", result, result);
        
        // xor
        sel = 4'b1001;   #10;   $display("XOR LOGIC  = %b(%0d)", result, result);
        
        // xnor
        sel = 4'b1010;   #10;   $display("XNOR LOGIC = %b(%0d)\n", result, result);
                
        
        // test case - 2
        A = 8'd202;  B = 8'd33;
        
        $display("Test case - 2 : A = %b(%0d) \t B = %b(%0d)\n", A, A, B, B);
        
        $display("Arithematic Operation :- \n");
        // addition
        sel = 4'b0000;  #10;    $display("Addition       = %b(%0d)", result, result);
        
        // subtraction
        sel = 4'b0001;  #10;    $display("Subtraction    = %b(%0d)", result, result);
        
        // multiplication
        sel = 4'b0010;  #10;    $display("Multiplication = %b(%0d)", result, result);
        
        // division
        sel = 4'b0011;  #10;    $display("Division : Quoitent = %b(%0d) \t Remainder = %b(%0d) \n", Q, Q, R, R);
        
        $display("Logical Operation :- \n");
        // not
        sel = 4'b0100;   #10;   $display("NOT LOGIC  = %b(%0d)", result, result);
        
        // and
        sel = 4'b0101;   #10;   $display("AND LOGIC  = %b(%0d)", result, result);
        
        //or
        sel = 4'b0110;   #10;   $display("OR LOGIC   = %b(%0d)", result, result);
        
        // nand
        sel = 4'b0111;   #10;   $display("NAND LOGIC = %b(%0d)", result, result);
        
        // nor
        sel = 4'b1000;   #10;   $display("NOR LOGIC  = %b(%0d)", result, result);
        
        // xor
        sel = 4'b1001;   #10;   $display("XOR LOGIC  = %b(%0d)", result, result);
        
        // xnor
        sel = 4'b1010;   #10;   $display("XNOR LOGIC = %b(%0d)\n", result, result);
                
        $finish;
    
    end

endmodule
