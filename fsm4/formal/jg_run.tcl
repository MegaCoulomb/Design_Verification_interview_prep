analyze -format sverilog fsm4.sv
elaborate fsm4
verify -formal -depth 40
report -assertion-summary
exit
