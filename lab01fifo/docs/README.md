# Lab 01: Synchronous FIFO with Ready/Valid Interface

### Objectives
- Implement a synchronous FIFO using SystemVerilog
- Design your own testbench and formal properties
- Run simulation and formal proof
- Prepare for FPGA synthesis

---

### Tasks
| Stage | Description | Status |
|--------|--------------|--------|
| RTL Implementation | Write FIFO logic and handshake | ☐ |
| Simulation | Create testbench and verify | ☐ |
| Formal | Add assertions and run proof | ☐ |
| FPGA Integration | TBD (future lab) | ☐ |

---

### Tips
- Keep RTL synchronous, with one clock domain.
- Use `$clog2(DEPTH)` for pointer sizing.
- Avoid combinational reads from uninitialized memory.
- Start small: DEPTH = 4, DATA_WIDTH = 8.
