class arb_env extends uvm_env;
  `uvm_component_utils(arb_env)
  arb_agent agent;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = arb_agent::type_id::create("agent", this);
  endfunction
endclass
