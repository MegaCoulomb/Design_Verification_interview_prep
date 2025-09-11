class fsm_driver extends uvm_driver#(fsm_seq_item);
  `uvm_component_utils(fsm_driver)
  virtual fsm_if vif;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual fsm_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","no vif");
  endfunction
  virtual task run_phase(uvm_phase phase);
    fsm_seq_item it;
    forever begin
      seq_item_port.get_next_item(it);
      @(posedge vif.clk);
      vif.in_sig <= it.in_sig;
      @(posedge vif.clk);
      vif.in_sig <= 0;
      seq_item_port.item_done();
    end
  endtask
endclass
