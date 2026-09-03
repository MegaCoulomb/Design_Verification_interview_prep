// fifo4_solution.sv
module fifo4 #(parameter W=8) (input logic clk, rst_n, input logic wr, rd, input logic [W-1:0] din, output logic [W-1:0] dout, output logic empty, full);
    logic [W-1:0] mem [0:3];
    logic [1:0] head, tail; logic [2:0] count;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin head<=0; tail<=0; count<=0; end else begin
            if (wr && !full) begin mem[head]<=din; head<=head+1; count<=count+1; end
            if (rd && !empty) begin dout<=mem[tail]; tail<=tail+1; count<=count-1; end
        end
    end
    assign empty = (count==0); assign full = (count==4);
endmodule
