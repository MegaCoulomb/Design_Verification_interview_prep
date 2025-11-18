//==============================================================
//  Lab 01: FIFO Testbench Skeleton
//  TODO: Create clock, reset, stimulus, and checker logic
//==============================================================

`timescale 1ns/1ps

module fifo_tb;

  // TODO: Declare signals matching DUT ports



  // DUT instance
  fifo_sync #(
    .DATA_WIDTH(8),
    .DEPTH(16)
  ) dut (
    // TODO: connect ports
  );

  // ======================================================
  // Clock and reset generation
  // ======================================================
  logic clk = 0;
  always #5 clk = ~clk;

  initial begin
    // TODO: Initialize signals and release reset
  end

  // ======================================================
  // TODO: Stimulus generation
  //  - Drive random valid_in/data_in
  //  - Randomize ready_out
  //  - Print or check output behavior
  // ======================================================



endmodule
