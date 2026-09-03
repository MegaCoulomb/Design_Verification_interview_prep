class rr_driver extends uvm_driver#(rr_seq_item);
  `uvm_component_utils(rr_driver)
  virtual rr_if vif;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual rr_if)::get(this, "", "vif", vif)) `uvm_fatal("NOVIF","no vif") ;
  endfunction
  virtual task run_phase(uvm_phase phase);
    rr_seq_item it;
    forever begin
      seq_item_port.get_next_item(it);
      @(posedge vif.cb);
      vif.req0 <= it.req0; vif.req1 <= it.req1;
      repeat($urandom_range(1,5)) @(posedge vif.cb);
      vif.req0 <= 0; vif.req1 <= 0;
      seq_item_port.item_done();
      repeat($urandom_range(1,4)) @(posedge vif.cb);
    end
  endtask
endclass
