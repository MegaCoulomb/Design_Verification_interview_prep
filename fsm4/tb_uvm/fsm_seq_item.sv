class fsm_seq_item extends uvm_sequence_item;
  rand bit in_sig;
  `uvm_object_utils(fsm_seq_item)
  function new(string name="fsm_seq_item"); super.new(name); endfunction
endclass
