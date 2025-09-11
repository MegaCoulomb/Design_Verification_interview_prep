class hs_seq_item extends uvm_sequence_item;
  rand bit req;
  rand bit [7:0] data;
  `uvm_object_utils(hs_seq_item)
  function new(string name="hs_seq_item"); super.new(name); endfunction
endclass
