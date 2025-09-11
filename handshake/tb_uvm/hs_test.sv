class hs_test extends uvm_test;
  `uvm_component_utils(hs_test)
  hs_env env;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    env = hs_env::type_id::create("env", this);
  endfunction
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    hs_sequence seq = hs_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer);
    #1000ns;
    phase.drop_objection(this);
  endtask
endclass
