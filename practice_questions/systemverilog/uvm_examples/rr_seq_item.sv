class rr_seq_item extends uvm_sequence_item;
  rand bit req0, req1;
  `uvm_object_utils(rr_seq_item)
  function new(string name="rr_seq_item"); super.new(name); endfunction
endclass
