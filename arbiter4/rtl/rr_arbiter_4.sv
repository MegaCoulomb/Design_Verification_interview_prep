/*
 rr_arbiter_4.sv - 4-port round-robin arbiter (parking)
*/
module rr_arbiter_4 (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [3:0]  req,
    output logic [3:0]  gnt,
    output logic        valid
);

    typedef logic [1:0] ptr_t;
    ptr_t ptr;
    logic [3:0] grant;
    logic [3:0] rotated_req;

    // rotate function: produce vector with ptr index at bit0
    function automatic logic [3:0] rotate(input logic [3:0] v, input int p);
        logic [3:0] r;
        for (int i=0;i<4;i++) r[i] = v[(p + i) % 4];
        return r;
    endfunction

    function automatic logic [3:0] rotate_back(input logic [3:0] v, input int p);
        logic [3:0] r;
        for (int i=0;i<4;i++) r[(p + i) % 4] = v[i];
        return r;
    endfunction

    always_comb begin
        rotated_req = rotate(req, ptr);
        grant = 4'b0000;
        if (rotated_req[0]) grant = 4'b0001;
        else if (rotated_req[1]) grant = 4'b0010;
        else if (rotated_req[2]) grant = 4'b0100;
        else if (rotated_req[3]) grant = 4'b1000;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ptr <= 2'd0;
            gnt <= 4'b0000;
            valid <= 1'b0;
        end else begin
            if (valid && gnt != 4'b0000) begin
                int gi = 0;
                for (int i=0;i<4;i++) if (gnt[i]) gi = i;
                if (req[gi]) begin
                    // keep grant
                    gnt <= gnt;
                    valid <= 1'b1;
                end else begin
                    // release and update pointer
                    ptr <= (gi + 1) % 4;
                    gnt <= rotate_back(grant, (gi + 1) % 4);
                    valid <= |gnt;
                end
            end else begin
                // no current grant
                gnt <= rotate_back(grant, ptr);
                valid <= |rotate_back(grant, ptr);
            end
        end
    end
endmodule
