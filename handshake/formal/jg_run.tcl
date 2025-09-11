analyze -format sverilog handshake_slave.sv
elaborate handshake_slave
verify -formal -depth 40
report -assertion-summary
exit
