class fsm_agent extends uvm_agent;
  `uvm_component_utils(fsm_agent)
  fsm_driver driver;
  fsm_monitor monitor;
  uvm_sequencer#(fsm_seq_item) sequencer;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    sequencer = uvm_sequencer#(fsm_seq_item)::type_id::create("sequencer", this);
    driver = fsm_driver::type_id::create("driver", this);
    monitor = fsm_monitor::type_id::create("monitor", this);
  endfunction
  virtual function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
