`timescale 1ns/1ps
module tb_top_hs;
    import uvm_pkg::*;
    logic clk = 0;
    always #5 clk = ~clk;
    hs_if h(.clk(clk));
    initial begin h.rst_n = 0; #20; h.rst_n = 1; end

    handshake_slave dut(.clk(clk), .rst_n(h.rst_n), .req(h.req), .ack(h.ack), .data_out(h.data_out), .data_in(h.data_in));

    initial begin
        uvm_config_db#(virtual hs_if)::set(null, "env.agent.driver", "vif", h);
        run_test("hs_test");
    end
endmodule
