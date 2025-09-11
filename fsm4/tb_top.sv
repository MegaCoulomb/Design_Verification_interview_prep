`timescale 1ns/1ps
module tb_top_fsm;
    import uvm_pkg::*;
    logic clk = 0;
    always #5 clk = ~clk;
    fsm_if fi(.clk(clk));
    initial begin fi.rst_n = 0; #20; fi.rst_n = 1; end

    fsm4 dut(.clk(clk), .rst_n(fi.rst_n), .in_sig(fi.in_sig), .out(fi.out));

    initial begin
        uvm_config_db#(virtual fsm_if)::set(null, "env.agent.driver", "vif", fi);
        run_test("fsm_test");
    end
endmodule
