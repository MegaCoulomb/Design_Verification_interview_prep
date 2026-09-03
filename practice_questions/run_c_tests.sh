#!/bin/bash
set -e
ROOT="/mnt/data/dv_design_questions_full"
cd "$ROOT"
make
mkdir -p c/tests_out
for src in c/reverse_string_solution.c c/max_in_array_solution.c c/bit_count_solution.c; do
  base=$(basename $src _solution.c)
  gcc -O2 -Wall c/${base}_solution.c -o bin/${base}
  ./bin/${base} > c/tests_out/${base}.out
  if cmp -s c/tests_out/${base}.out c/tests/${base}.exp; then
    echo "${base}: PASS"
  else
    echo "${base}: FAIL"
    echo "Expected:"; cat c/tests/${base}.exp
    echo "Got:"; cat c/tests_out/${base}.out
  fi
done
