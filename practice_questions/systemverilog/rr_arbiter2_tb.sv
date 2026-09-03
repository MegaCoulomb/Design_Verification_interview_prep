// rr_arbiter2_tb.sv - simple testbench (functional smoke tests)
`timescale 1ns/1ps
module rr_arbiter2_tb;
  reg clk = 0;
  always #5 clk = ~clk;

reg rst_n;
reg req0, req1;
wire gnt0, gnt1;
rr_arbiter2 dut(.clk(clk), .rst_n(rst_n), .req0(req0), .req1(req1), .gnt0(gnt0), .gnt1(gnt1));

initial begin
  rst_n = 0; req0=0; req1=0; #20; rst_n=1;
  // simple stimulus
  req0 = 1; req1 = 1; #20;
  req0 = 0; req1 = 1; #20;
  req0 = 1; req1 = 0; #20;
  $display("gnt0=%b gnt1=%b", gnt0, gnt1);
  $finish;
end

endmodule
