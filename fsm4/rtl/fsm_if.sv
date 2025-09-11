interface fsm_if(input bit clk);
    logic rst_n;
    logic in_sig;
    logic [1:0] out;
    clocking cb @(posedge clk);
        output in_sig;
        input out;
    endclocking
endinterface
