//==============================================================
//  Lab 01: FIFO Formal Verification
//  TODO: Write SystemVerilog Assertions to prove correctness
//==============================================================

module fifo_formal #(parameter DATA_WIDTH = 8, DEPTH = 16)(
    input logic clk,
    input logic rst_n
);

  // Instantiate DUT here if needed
  // TODO: connect formal signals



  // Example skeletons to guide you:
  // assert property (@(posedge clk) disable iff (!rst_n) <condition>);

  // TODO:
  // - FIFO should never overflow
  // - FIFO should never underflow
  // - Data integrity (input matches output sequence)
  // - Ready/valid compliance

endmodule
