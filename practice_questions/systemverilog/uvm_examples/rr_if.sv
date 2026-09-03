interface rr_if(input bit clk);
  logic rst_n;
  logic req0, req1;
  logic gnt0, gnt1;
  clocking cb @(posedge clk);
    output req0, req1;
    input gnt0, gnt1;
  endclocking
endinterface
