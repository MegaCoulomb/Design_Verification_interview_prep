class arb_seq_item extends uvm_sequence_item;
  rand bit [3:0] req;
  `uvm_object_utils(arb_seq_item)
  function new(string name="arb_seq_item"); super.new(name); endfunction
endclass
