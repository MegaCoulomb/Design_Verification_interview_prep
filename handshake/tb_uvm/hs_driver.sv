class hs_driver extends uvm_driver#(hs_seq_item);
  `uvm_component_utils(hs_driver)
  virtual hs_if vif;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual hs_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","no vif");
  endfunction
  virtual task run_phase(uvm_phase phase);
    hs_seq_item it;
    forever begin
      seq_item_port.get_next_item(it);
      @(posedge vif.clk);
      vif.req <= it.req;
      vif.data_in <= it.data;
      // wait for ack
      wait (vif.ack == 1);
      // deassert req
      @(posedge vif.clk);
      vif.req <= 0;
      seq_item_port.item_done();
      // wait for ack to drop
      wait (vif.ack == 0);
      repeat ($urandom_range(1,5)) @(posedge vif.clk);
    end
  endtask
endclass
