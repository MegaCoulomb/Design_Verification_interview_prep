# DV Interview Prep — Practice App Design

## Goal

Turn this repo's existing content (arbiter4, fifo, fsm4, handshake, lab01-05) into a
self-checking practice platform. First milestone: **formal property writing exercises**,
graded automatically without needing a JasperGold license.

## Why formal-first, and why not JasperGold

You currently have neither `iverilog` nor JasperGold installed, and JasperGold requires a
commercial license that isn't practical for a personal practice tool. The free, open-source
equivalent is **SymbiYosys (`sby`)**, built on Yosys + a SAT/SMT solver (Boolector or z3).
It reads standard SVA (`property`/`assert property`), supports `bmc` and `prove` engines,
and produces a pass/fail per-property report plus counterexample traces — functionally
similar to what `jg_run.tcl` does today, just free and scriptable.

**Platform note:** `sby`/Yosys are Linux-native. On Windows the practical path is either:
- WSL2 with `apt install yosys` + `pip install sby` (or build from source), or
- A Docker image bundling yosys + sby + boolector (e.g. build one FROM `debian:stable` or
  use community images like `hdlc/sby`), invoked from PowerShell via `docker run`.

Docker is recommended for the app itself since it isolates each grading run and works the
same on any machine.

## Exercise model: "write a property that actually catches bugs"

A property that vacuously passes (never fires) is worthless. Every formal exercise should
therefore ship **two DUT variants**:

1. `dut_golden.sv` — the correct RTL (already in `rtl/` for arbiter4/fifo/fsm4/handshake).
2. `dut_buggy_<n>.sv` — one or more variants with a specific injected bug.

The student writes properties in a single template file. Grading runs the **same properties**
against both variants:

| Property behavior | Golden DUT | Buggy DUT | Verdict |
|---|---|---|---|
| Correct, meaningful property | PASS | FAIL (counterexample found) | ✅ full credit |
| Vacuous / too weak | PASS | PASS | ⚠️ "property didn't catch the bug" |
| Over-constrained / wrong | FAIL | — | ❌ "property is wrong even on golden RTL" |

This gives objective, tool-verified feedback without a hand-written answer key for every
possible correct property.

## Exercise package layout

```
exercises/
  formal/
    arb_one_hot_grant/
      task.md                 # prompt: "Write a property that gnt is always one-hot or zero"
      dut_golden.sv            # copy/symlink of rtl/rr_arbiter_4.sv
      dut_buggy_1.sv           # e.g. two grants asserted simultaneously
      dut_buggy_2.sv           # e.g. grant asserted with no request
      properties_template.sv   # TODO markers for student
      sby_template.sby         # SymbiYosys config, DUT name templated
      meta.json                # {difficulty, concept_tags, bug_descriptions}
    fifo_no_overflow/
      ...
    handshake_no_deadlock/
      ...
```

`meta.json` example:
```json
{
  "concept": "one-hot encoding invariant",
  "difficulty": "easy",
  "bugs": [
    {"id": "dut_buggy_1", "description": "arbiter can grant two ports in the same cycle"},
    {"id": "dut_buggy_2", "description": "grant asserted when no request is pending"}
  ]
}
```

## Grading algorithm (pseudocode)

```
for each dut in [golden, buggy_1, buggy_2, ...]:
    render sby_template.sby with DUT = dut, properties = student_properties_template.sv
    run `sby -f <config>.sby` (in Docker container with yosys+sby+boolector)
    parse status/*.txt or the console summary for PASS/FAIL per named property

result = {
  golden_all_pass: bool,
  bugs_caught: [bug_id for bug_id, dut in buggy variants if any property FAILed on it],
  bugs_missed: [...],
}

score = full credit if golden_all_pass and bugs_caught == all bugs
        partial credit if golden_all_pass and some bugs caught
        fail if golden RTL itself fails (property is wrong)
```

Feedback shown to the student: which bugs were caught/missed, plus the counterexample
waveform/trace text sby produces for any missed bug (helps them see why their property
didn't fire).

## Content sourcing from this repo

- `arbiter4/formal/arb_properties.sv` and `rtl/rr_arbiter_4.sv` → seed the first exercise
  (one-hot grant, fairness/round-robin ordering, no grant without request).
- `fifo/formal/fifo_props.sv` and `rtl/fifo_sync.sv` → overflow/underflow, count-matches-
  pointers invariant, data integrity (FIFO order preserved).
- `fsm4/formal/fsm_props.sv` → reachability of all states, no illegal transitions.
- `handshake/` → no-deadlock (req eventually gets ack), data stability during handshake.
- Bug variants can be hand-authored once per exercise (small, deliberate mutations — e.g.
  flip a condition, drop a reset, off-by-one on a pointer). This is the main authoring work;
  everything else (harness, Docker image, sby templates) is reusable across exercises.

## Build phases

1. **Phase 1 (this doc)** — design only, no code.
2. **Phase 2 — CLI grading core**: a Python script `grade_formal.py <exercise_dir>` that
   does the render → `docker run sby` → parse → report loop above for one exercise directory.
   Runs from PowerShell, no GUI. Validate with the arbiter one-hot-grant exercise end to end.
3. **Phase 3 — author remaining formal exercises**: fifo, fsm4, handshake, each with 2-3 bug
   variants, reusing the Phase 2 harness.
4. **Phase 4 — other exercise types**, reusing the same "golden vs. buggy" pattern:
   - RTL debug exercises using the existing UVM testbenches with Icarus Verilog instead of
     formal (same pass/golden/buggy comparison, but via simulation).
   - UVM scoreboard/sequence completion exercises (student fills in `*_scoreboard.sv`).
   - Concept quiz mode from `Zipped_Problems/dv_design_questions_full_with_all_tools.zip`.
5. **Phase 5 — optional web UI**: Monaco editor + "Run" button calling the Phase 2/3 CLI
   harness as a backend service, with a simple progress tracker (SQLite/JSON).

## Open items to decide before Phase 2

- Confirm Docker Desktop (or WSL2 directly) is available on this machine for running `sby`.
- Pick the solver backend for SymbiYosys (Boolector is fast and free; z3 is an alternative).
- Decide bug-variant authoring format: fully separate `.sv` files (simplest) vs. a single
  file with `` `ifdef BUG_N `` guards (less duplication, slightly more fragile).
