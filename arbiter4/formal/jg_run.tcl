# jg_run.tcl - Arbiter formal run
analyze -format sverilog rr_arbiter_4.sv
elaborate rr_arbiter_4
verify -formal -depth 50
report -assertion-summary
exit
