class arb_driver extends uvm_driver #(arb_seq_item);
  `uvm_component_utils(arb_driver)
  virtual arb_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual arb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","Virtual interface not set")
  endfunction

  virtual task run_phase(uvm_phase phase);
    arb_seq_item req_item;
    forever begin
      seq_item_port.get_next_item(req_item);
      @(posedge vif.clk);
      vif.req <= req_item.req;
      // hold for a few cycles
      repeat ($urandom_range(1,8)) @(posedge vif.clk);
      vif.req <= 4'b0000;
      seq_item_port.item_done();
      repeat ($urandom_range(1,5)) @(posedge vif.clk);
    end
  endtask
endclass
