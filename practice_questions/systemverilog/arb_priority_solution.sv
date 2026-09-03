// arb_prio4_solution.sv
module arb_prio4(input logic clk, rst_n, input logic [3:0] req, output logic [3:0] gnt);
    always_comb begin
        gnt = 4'b0;
        if (req[3]) gnt = 4'b1000;
        else if (req[2]) gnt = 4'b0100;
        else if (req[1]) gnt = 4'b0010;
        else if (req[0]) gnt = 4'b0001;
    end
endmodule
