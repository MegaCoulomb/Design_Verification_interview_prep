// handshake_solution.sv
module handshake(input logic clk, rst_n, input logic req, output logic ack);
    logic pending;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) pending <= 1'b0;
        else begin
            if (req) pending <= 1'b1;
            else if (ack) pending <= 1'b0;
        end
    end
    assign ack = pending & ~req; // simplistic example
endmodule
