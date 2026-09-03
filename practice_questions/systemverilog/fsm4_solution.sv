// fsm4_solution.sv
module fsm4(input logic clk, rst_n, input logic start, input logic done, output logic [1:0] state);
    typedef enum logic [1:0] {IDLE=0, READ=1, WRITE=2, DONE=3} st_t;
    st_t cur, nxt;
    always_ff @(posedge clk or negedge rst_n) if (!rst_n) cur<=IDLE; else cur<=nxt;
    always_comb begin nxt = cur; case(cur)
        IDLE: if (start) nxt = READ;
        READ: if (done) nxt = WRITE;
        WRITE: if (done) nxt = DONE;
        DONE: nxt = IDLE;
    endcase end
    assign state = cur;
endmodule
