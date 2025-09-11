class fifo_driver extends uvm_driver#(fifo_seq_item);
  `uvm_component_utils(fifo_driver)
  virtual fifo_if vif;
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","no vif");
  endfunction
  virtual task run_phase(uvm_phase phase);
    fifo_seq_item it;
    forever begin
      seq_item_port.get_next_item(it);
      @(posedge vif.clk);
      if (it.wr && !vif.full) vif.wr_en <= 1; else vif.wr_en <= 0;
      vif.wr_data <= it.data;
      if (it.rd && !vif.empty) vif.rd_en <= 1; else vif.rd_en <= 0;
      @(posedge vif.clk);
      vif.wr_en <= 0; vif.rd_en <= 0;
      seq_item_port.item_done();
    end
  endtask
endclass
