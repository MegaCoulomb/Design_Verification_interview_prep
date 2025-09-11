# jg_run.tcl - FIFO formal
analyze -format sverilog fifo_sync.sv
elaborate fifo_sync
verify -formal -depth 80
report -assertion-summary
exit
