class arb_agent extends uvm_agent;
  `uvm_component_utils(arb_agent)
  arb_driver driver;
  arb_monitor monitor;
  uvm_sequencer#(arb_seq_item) sequencer;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer = uvm_sequencer#(arb_seq_item)::type_id::create("sequencer", this);
    driver = arb_driver::type_id::create("driver", this);
    monitor = arb_monitor::type_id::create("monitor", this);
    uvm_config_db#(virtual arb_if)::set(this, "driver", "vif", null); // set in top
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
