interface arb_if(input bit clk);
    logic rst_n;
    logic [3:0] req;
    logic [3:0] gnt;
    logic       valid;

    clocking cb @(posedge clk);
        output req;
        input  gnt, valid;
    endclocking
endinterface
