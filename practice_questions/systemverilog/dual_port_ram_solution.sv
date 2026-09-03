// dpram_solution.sv
module dpram #(parameter W=8, DEP=256) (input logic clk, we_a, we_b, input logic [$clog2(DEP)-1:0] addr_a, addr_b, input logic [W-1:0] din_a, din_b, output logic [W-1:0] dout_a, dout_b);
    logic [W-1:0] mem [0:DEP-1];
    always_ff @(posedge clk) begin
        if (we_a) mem[addr_a] <= din_a;
        dout_a <= mem[addr_a];
        if (we_b) mem[addr_b] <= din_b;
        dout_b <= mem[addr_b];
    end
endmodule
