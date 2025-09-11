module fifo_sync #(
    parameter WIDTH = 32,
    parameter DEPTH = 16
) (
    input  logic clk,
    input  logic rst_n,
    input  logic wr_en,
    input  logic rd_en,
    input  logic [WIDTH-1:0] wr_data,
    output logic [WIDTH-1:0] rd_data,
    output logic full,
    output logic empty,
    output logic almost_full,
    output logic [$clog2(DEPTH):0] count
);
    localparam PTR_WIDTH = $clog2(DEPTH);
    logic [WIDTH-1:0] mem [0:DEPTH-1];
    logic [PTR_WIDTH-1:0] wr_ptr, rd_ptr;
    logic [PTR_WIDTH:0] fifo_count;

    assign count = fifo_count;
    assign empty = (fifo_count == 0);
    assign full = (fifo_count == DEPTH);
    assign almost_full = (fifo_count >= DEPTH-1);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0; rd_ptr <= 0; fifo_count <= 0; rd_data <= '0;
        end else begin
            if (wr_en && !full) begin
                mem[wr_ptr] <= wr_data;
                wr_ptr <= wr_ptr + 1;
            end
            if (rd_en && !empty) begin
                rd_data <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
            if ((wr_en && !full) && !(rd_en && !empty)) fifo_count <= fifo_count + 1;
            else if (!(wr_en && !full) && (rd_en && !empty)) fifo_count <= fifo_count - 1;
        end
    end
endmodule
