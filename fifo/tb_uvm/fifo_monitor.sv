class fifo_monitor extends uvm_component;
  `uvm_component_utils(fifo_monitor)
  virtual fifo_if vif;
  uvm_analysis_port#(uvm_sequence_item) ap;
  function new(string name, uvm_component parent); super.new(name,parent); ap = new("ap", this); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","no vif");
  endfunction
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      // publish simple sample
      uvm_sequence_item t = new();
      ap.write(t);
    end
  endtask
endclass
