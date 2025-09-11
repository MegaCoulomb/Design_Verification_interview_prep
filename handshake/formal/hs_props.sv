module tb_hs_formal(input logic clk, input logic rst_n, input logic req);
    handshake_slave dut(.clk(clk), .rst_n(rst_n), .req(req), .ack(), .data_out(), .data_in(8'd0));
endmodule
