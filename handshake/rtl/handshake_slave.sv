module handshake_slave (
    input logic clk,
    input logic rst_n,
    input logic req,
    output logic ack,
    output logic [7:0] data_out,
    input logic [7:0] data_in
);
    typedef enum logic [1:0] {IDLE=2'b00, GOT_REQ=2'b01, ACK=2'b10, WAIT_REL=2'b11} state_t;
    state_t state, next_state;

    always_comb begin
        next_state = state;
        case (state)
            IDLE: if (req) next_state = GOT_REQ;
            GOT_REQ: next_state = ACK;
            ACK: if (!req) next_state = WAIT_REL;
            WAIT_REL: next_state = IDLE;
        endcase
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            ack <= 0;
            data_out <= 8'd0;
        end else begin
            state <= next_state;
            ack <= (next_state == ACK) || (state == ACK);
            if (state == GOT_REQ) data_out <= data_in;
        end
    end
endmodule
