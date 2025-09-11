class arb_sequence extends uvm_sequence #(arb_seq_item);
  `uvm_object_utils(arb_sequence)
  function new(string name="arb_sequence"); super.new(name); endfunction

  virtual task body();
    arb_seq_item it;
    it = arb_seq_item::type_id::create("it");
    repeat (100) begin
      assert(it.randomize());
      start_item(it);
      finish_item(it);
    end
  endtask
endclass
