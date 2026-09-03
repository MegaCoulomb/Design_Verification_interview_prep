// arb_round_robin_solution.sv
module arb_rr #(parameter N=4)(input logic clk, rst_n, input logic [N-1:0] req, output logic [N-1:0] gnt);
    logic [$clog2(N)-1:0] ptr;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) ptr <= 0;
        else begin
            gnt = '0;
            for (int i=0;i<N;i++) begin
                int idx=(ptr+i)%N;
                if (req[idx]) begin gnt[idx]=1; ptr<= (idx+1)%N; break; end
            end
        end
    end
endmodule
