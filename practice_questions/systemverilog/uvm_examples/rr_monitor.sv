class rr_monitor extends uvm_component;
  `uvm_component_utils(rr_monitor)
  virtual rr_if vif;
  uvm_analysis_port#(rr_seq_item) ap;
  function new(string name, uvm_component parent); super.new(name,parent); ap = new("ap", this); endfunction
  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual rr_if)::get(this, "", "vif", vif)) `uvm_fatal("NOVIF","no vif") ;
  endfunction
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.cb);
      rr_seq_item itm = rr_seq_item::type_id::create("itm");
      itm.req0 = vif.req0; itm.req1 = vif.req1;
      ap.write(itm);
    end
  endtask
endclass
