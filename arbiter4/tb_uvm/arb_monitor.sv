class arb_monitor extends uvm_component;
  `uvm_component_utils(arb_monitor)
  virtual arb_if vif;
  uvm_analysis_port#(uvm_sequence_item) ap;

  function new(string name, uvm_component parent);
    super.new(name,parent);
    ap = new("ap", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual arb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","No vif");
  endfunction

  virtual task run_phase(uvm_phase phase);
    uvm_sequence_item trans;
    forever begin
      @(posedge vif.clk);
      trans = new();
      // attach fields
      trans.set_id_info(this.get_full_name(), $sformatf("%0t", $time));
      // publish raw signals in uvm analysis
      ap.write(trans);
    end
  endtask
endclass
