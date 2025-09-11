module tb_fsm_formal(input logic clk, input logic rst_n, input logic in_sig);
    fsm4 dut(.clk(clk), .rst_n(rst_n), .in_sig(in_sig), .out());
endmodule
