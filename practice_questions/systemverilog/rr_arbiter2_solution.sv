// rr_arbiter2_solution.sv
module rr_arbiter2 (input logic clk, rst_n, input logic req0, req1, output logic gnt0, gnt1);
    logic ptr;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) ptr <= 0;
        else if (gnt0) ptr <= 1;
        else if (gnt1) ptr <= 0;
    end
    always_comb begin
        gnt0 = 0; gnt1 = 0;
        if (req0 && req1) begin if (ptr==0) gnt0=1; else gnt1=1; end
        else if (req0) gnt0=1; else if (req1) gnt1=1;
    end
endmodule
