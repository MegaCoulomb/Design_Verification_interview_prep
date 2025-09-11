`timescale 1ns/1ps
module tb_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    logic clk = 0;
    always #5 clk = ~clk;

    arb_if arb_if0(.clk(clk));

    // reset
    initial begin
        arb_if0.rst_n = 0;
        arb_if0.req = 4'b0000;
        #20;
        arb_if0.rst_n = 1;
    end

    rr_arbiter_4 dut(
        .clk(clk),
        .rst_n(arb_if0.rst_n),
        .req(arb_if0.req),
        .gnt(arb_if0.gnt),
        .valid(arb_if0.valid)
    );

    initial begin
        // set virtual interface for UVM
        uvm_config_db#(virtual arb_if)::set(null, "env.agent.driver", "vif", arb_if0);
        run_test("arb_test");
    end
endmodule
