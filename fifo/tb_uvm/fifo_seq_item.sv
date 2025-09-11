class fifo_seq_item extends uvm_sequence_item;
  rand bit wr;
  rand bit rd;
  rand bit [31:0] data;
  `uvm_object_utils(fifo_seq_item)
  function new(string name="fifo_seq_item"); super.new(name); endfunction
endclass
