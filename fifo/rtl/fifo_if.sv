interface fifo_if(input bit clk);
    logic rst_n;
    logic wr_en;
    logic rd_en;
    logic [31:0] wr_data;
    logic [31:0] rd_data;
    logic full;
    logic empty;
    clocking cb @(posedge clk);
        output wr_en, rd_en, wr_data;
        input rd_data, full, empty;
    endclocking
endinterface
