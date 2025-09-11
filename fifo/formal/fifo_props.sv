module tb_fifo_formal(input logic clk, input logic rst_n, input logic wr_en, input logic rd_en);
    fifo_sync dut(.clk(clk), .rst_n(rst_n), .wr_en(wr_en), .rd_en(rd_en), .wr_data(32'd0), .rd_data());
endmodule

// Add simple assertions in separate file as needed
