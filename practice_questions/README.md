DV Design Questions - Full Package
=================================

This package contains 30 design & verification problems (10 C, 10 Python, 10 SystemVerilog).
Location: /mnt/data/dv_design_questions_full

How to build & run C and Python solutions:
  cd /mnt/data/dv_design_questions_full
  make run_all

SystemVerilog testbenches:
  Each solution has a simple smoke testbench in systemverilog/*_tb.sv.
  Use your simulator (VCS/Questa/iverilog) to compile the solution and testbench, for example:
    iverilog -g2012 systemverilog/rr_arbiter2_solution.sv systemverilog/rr_arbiter2_tb.sv -o rr_tb.vvp
    vvp rr_tb.vvp

Notes:
- The SV testbenches provided are basic smoke templates. Expand stimuli for thorough verification.
- The Makefile builds C solution executables into ./bin and runs Python scripts.



Added features:
- pytest tests for several Python solutions under python/tests
- C test harness script run_c_tests.sh to compile selected C programs and compare output
- UVM example skeletons for rr_arbiter2 and fifo4 under systemverilog/uvm_examples
- Combined PDFs including both problems and solutions per category
