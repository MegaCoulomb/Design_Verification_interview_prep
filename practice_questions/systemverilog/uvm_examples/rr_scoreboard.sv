class rr_scoreboard extends uvm_component;
  `uvm_component_utils(rr_scoreboard)
  uvm_analysis_imp#(rr_seq_item, rr_scoreboard) analysis_export;
  int ptr;
  function new(string name, uvm_component parent); super.new(name,parent); analysis_export = new("analysis_export", this); ptr = 0; endfunction
  function void write(rr_seq_item t);
    int expected = -1;
    for (int i=0;i<2;i++) begin int idx=(ptr+i)%2; if ((idx==0 && t.req0) || (idx==1 && t.req1)){ expected=idx; break; } end
    if (expected!=-1) ptr = (expected+1)%2;
    `uvm_info("RSB", $sformatf("expected grant idx %0d", expected), UVM_LOW)
  endfunction
endclass
