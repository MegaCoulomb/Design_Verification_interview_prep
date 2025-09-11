class hs_sequence extends uvm_sequence#(hs_seq_item);
  `uvm_object_utils(hs_sequence)
  function new(string name="hs_sequence"); super.new(name); endfunction
  virtual task body();
    hs_seq_item it = hs_seq_item::type_id::create("it");
    repeat (50) begin
      assert(it.randomize());
      start_item(it); finish_item(it);
    end
  endtask
endclass
