// fifo_param_starter.sv - parameterizable FIFO with almost_full/empty
module fifo_param #(parameter W=8, DEP=16) (input logic clk, rst_n, input logic wr, rd, input logic [W-1:0] din, output logic [W-1:0] dout, output logic empty, full, almost_full, almost_empty);
    // TODO
endmodule
