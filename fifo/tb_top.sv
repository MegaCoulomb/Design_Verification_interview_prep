`timescale 1ns/1ps
module tb_top_fifo;
    import uvm_pkg::*;
    logic clk = 0;
    always #5 clk = ~clk;
    fifo_if fi(.clk(clk));
    initial begin fi.rst_n = 0; #20; fi.rst_n = 1; end

    fifo_sync dut(.clk(clk), .rst_n(fi.rst_n), .wr_en(fi.wr_en), .rd_en(fi.rd_en),
                  .wr_data(fi.wr_data), .rd_data(fi.rd_data), .full(fi.full), .empty(fi.empty),
                  .almost_full(), .count());

    initial begin
        uvm_config_db#(virtual fifo_if)::set(null, "env.agent.driver", "vif", fi);
        run_test("fifo_test");
    end
endmodule
