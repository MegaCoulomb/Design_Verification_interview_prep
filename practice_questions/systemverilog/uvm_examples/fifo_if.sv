interface fifo_if(input bit clk);
  logic rst_n; logic wr, rd; logic [7:0] din; logic [7:0] dout; logic empty, full;
  clocking cb @(posedge clk);
    output wr, rd, din;
    input dout, empty, full;
  endclocking
endinterface
