#=============================================================
# Lab 01: FIFO Makefile
#=============================================================
TOP = fifo_tb
RTL = ../rtl/fifo_sync.sv
TB  = ../tb/fifo_tb.sv
FORMAL = ../formal/fifo_formal.sv

all: sim

sim:
	iverilog -g2012 -o simv $(RTL) $(TB)
	vvp simv

wave:
	gtkwave dump.vcd &

formal:
	sby -f fifo_formal.sby

clean:
	rm -f simv *.vcd
