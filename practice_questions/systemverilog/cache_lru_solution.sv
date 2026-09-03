// cache_lru_solution.sv - conceptual 4-line 2-way set-assoc with LRU bits
module cache_lru(input logic clk, rst_n, input logic req, input logic [1:0] addr, input logic [31:0] wdata, input logic we, output logic hit);
    logic [1:0] tag [0:1]; logic valid [0:1]; logic [31:0] data [0:1]; logic lru; // greatly simplified
    // On access, check way 0/1, update lru bit on misses/ways; concept only
    assign hit = (valid[0] && tag[0]==addr) || (valid[1] && tag[1]==addr);
    always_ff @(posedge clk) if (req && we) begin if (!hit) begin // refill simple
        tag[0] <= addr; valid[0] <= 1; data[0] <= wdata; lru <= ~lru; end else data[0]<=wdata; end
endmodule
