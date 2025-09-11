class fifo_sequence extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence)
  function new(string name="fifo_sequence"); super.new(name); endfunction
  virtual task body();
    fifo_seq_item it = fifo_seq_item::type_id::create("it");
    repeat (200) begin
      assert(it.randomize());
      start_item(it);
      finish_item(it);
    end
  endtask
endclass
