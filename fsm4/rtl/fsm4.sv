module fsm4 (
    input logic clk,
    input logic rst_n,
    input logic in_sig,
    output logic [1:0] out
);
    typedef enum logic [1:0] {S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11} state_t;
    state_t state, next_state;

    always_comb begin
        unique case (state)
            S0: next_state = (in_sig) ? S1 : S0;
            S1: next_state = (in_sig) ? S3 : S2;
            S2: next_state = (in_sig) ? S1 : S0;
            S3: next_state = (in_sig) ? S3 : S2;
            default: next_state = S0;
        endcase
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S0;
        else state <= next_state;
    end

    assign out = state;
endmodule
