module tb_top_formal (input logic clk, input logic rst_n, input logic [3:0] req, output logic [3:0] gnt, output logic valid);
    rr_arbiter_4 dut(.clk(clk), .rst_n(rst_n), .req(req), .gnt(gnt), .valid(valid));
endmodule

// simple properties
// One-hot grant
property one_hot_gnt (logic [3:0] g);
    (g == 4'b0000) || (g == 4'b0001) || (g == 4'b0010) || (g == 4'b0100) || (g == 4'b1000);
endproperty
// bind and assert in JasperGold script if needed
