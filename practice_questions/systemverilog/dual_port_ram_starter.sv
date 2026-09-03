// dual_port_ram_starter.sv
module dpram #(parameter W=8, DEP=256) (input logic clk, we_a, we_b, input logic [$clog2(DEP)-1:0] addr_a, addr_b, input logic [W-1:0] din_a, din_b, output logic [W-1:0] dout_a, dout_b);
    // TODO implement sync dual-port RAM
endmodule
