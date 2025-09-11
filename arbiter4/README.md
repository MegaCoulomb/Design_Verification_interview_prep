Arbiter4 package
================

Structure:
- rtl/rr_arbiter_4.sv
- tb_uvm/    (UVM environment files)
- formal/    (SVA / JasperGold script)
- cpp/       (vector generator)

Build & Run (example with VCS):
  vcs -full64 -sverilog +acc +vpi +vcs+lic+wait -f filelist.f
  ./simv

UVM:
  Ensure UVM library is available and `uvm_macros.svh` on include path.
  Top tb_top runs run_test("arb_test");

Formal:
  jasper -f formal/jg_run.tcl

