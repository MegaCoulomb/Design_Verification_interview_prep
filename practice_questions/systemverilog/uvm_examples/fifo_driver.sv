class fifo_driver extends uvm_driver#(fifo_seq_item);
  `uvm_component_utils(fifo_driver)
  virtual fifo_if vif;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif)) `uvm_fatal("NOVIF","no vif") ;
  endfunction
  virtual task run_phase(uvm_phase phase);
    fifo_seq_item it;
    forever begin seq_item_port.get_next_item(it); @(posedge vif.cb); vif.wr<=it.wr; vif.rd<=it.rd; vif.din<=it.din;
      repeat($urandom_range(1,4)) @(posedge vif.cb); vif.wr<=0; vif.rd<=0; seq_item_port.item_done(); end
  endtask
endclass
