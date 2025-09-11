interface hs_if(input bit clk);
    logic rst_n;
    logic req;
    logic ack;
    logic [7:0] data_in;
    logic [7:0] data_out;
    clocking cb @(posedge clk);
        output req, data_in;
        input ack, data_out;
    endclocking
endinterface
