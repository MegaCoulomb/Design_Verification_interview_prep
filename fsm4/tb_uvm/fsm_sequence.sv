class fsm_sequence extends uvm_sequence#(fsm_seq_item);
  `uvm_object_utils(fsm_sequence)
  function new(string name="fsm_sequence"); super.new(name); endfunction
  virtual task body();
    fsm_seq_item it = fsm_seq_item::type_id::create("it");
    // walk through transitions
    bit pattern[] = '{0,1,1,0,0,1,0,1};
    foreach (pattern[i]) begin
      it.in_sig = pattern[i];
      start_item(it); finish_item(it);
    end
  endtask
endclass
