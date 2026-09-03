// fifo_param_solution.sv
module fifo_param #(parameter W=8, DEP=16) (input logic clk, rst_n, input logic wr, rd, input logic [W-1:0] din, output logic [W-1:0] dout, output logic empty, full, almost_full, almost_empty);
    logic [W-1:0] mem [0:DEP-1]; logic [$clog2(DEP)-1:0] head, tail; integer count;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin head<=0; tail<=0; count<=0; end else begin
            if (wr && count<DEP) begin mem[head]<=din; head<=head+1; count<=count+1; end
            if (rd && count>0) begin dout<=mem[tail]; tail<=tail+1; count<=count-1; end
        end
    end
    assign empty = (count==0); assign full = (count==DEP);
    assign almost_full = (count >= DEP-1); assign almost_empty = (count <= 1);
endmodule
