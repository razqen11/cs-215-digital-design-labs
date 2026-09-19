// CS-215 Lab 02 Task 4: SR Flip-Flop Template
`timescale 1ns/1ps

module dut (
  input  wire clk,
  input  wire rst, // Synchronous active-high reset
  input  wire s,
  input  wire r,
  output reg  q,
  output wire q_bar
);

  // Assign q_bar as the negation of q
  assign q_bar = ~q;

  // TODO: Implement SR Flip-Flop logic with synchronous reset
  // Hint: State transitions on clk rising edge:
  // S=0, R=0 -> Hold
  // S=0, R=1 -> Reset (q=0)
  // S=1, R=0 -> Set (q=1)
  // S=1, R=1 -> Invalid/Undefined (usually q = 1'bx or state not changed; let's set q = 1'bx)

  always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else if (s == 0 && r == 0)
        q <= q;
    else if (s == 0 && r == 1)
        q <= 1'b0;
    else if (s == 1 && r == 0)
        q <= 1'b1;
    else
        q <= 1'bx;
  end

endmodule
