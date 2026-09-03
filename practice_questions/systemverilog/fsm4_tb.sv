// fsm4_tb.sv - simple testbench (functional smoke tests)
`timescale 1ns/1ps
module fsm4_tb;
  reg clk = 0;
  always #5 clk = ~clk;

// Generic testbench placeholder for fsm4_solution.sv
initial begin
  $display("Please run a simulator and instantiate fsm4 solution module to test behavior.");
  $finish;
end

endmodule
