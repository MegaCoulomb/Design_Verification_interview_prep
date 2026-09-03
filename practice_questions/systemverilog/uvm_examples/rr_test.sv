class rr_test extends uvm_test;
  `uvm_component_utils(rr_test)
  rr_env env;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase); env = rr_env::type_id::create("env", this); endfunction
  virtual task run_phase(uvm_phase phase); phase.raise_objection(this); // start sequences here - omitted for brevity
    #5000ns; phase.drop_objection(this); endtask
endclass
