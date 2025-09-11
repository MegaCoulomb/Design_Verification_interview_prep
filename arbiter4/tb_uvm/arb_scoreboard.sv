class arb_scoreboard extends uvm_component;
  `uvm_component_utils(arb_scoreboard)
  function new(string name, uvm_component parent); super.new(name,parent); endfunction

  virtual task run_phase(uvm_phase phase);
    // simple placeholder
    wait (0);
  endtask
endclass
