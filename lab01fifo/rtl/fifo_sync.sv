//==============================================================
//  Lab 01: Synchronous FIFO with Ready/Valid Interface
//  TODO: Implement FIFO design logic
//==============================================================

module fifo_sync #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 16
)(
    input  logic                   clk,
    input  logic                   rst_n,
    input  logic [DATA_WIDTH-1:0]  data_in,
    input  logic                   valid_in,
    output logic                   ready_in,
    output logic [DATA_WIDTH-1:0]  data_out,
    output logic                   valid_out,
    input  logic                   ready_out
);

    // ======================================================
    // TODO: Declare internal signals
    //  - memory array
    //  - read/write pointers
    //  - status flags (full, empty)
    // ======================================================



    // ======================================================
    // TODO: Implement pointer update logic
    // ======================================================



    // ======================================================
    // TODO: Implement ready/valid handshake and data path
    // ======================================================



endmodule
