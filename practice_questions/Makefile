CC = gcc
CFLAGS = -O2 -Wall

C_SRCS = $(wildcard c/*_solution.c)
C_PROGS = $(patsubst c/%_solution.c, bin/%,$(C_SRCS))

PY_SCRIPTS = $(wildcard python/*_solution.py)

all: dirs $(C_PROGS)

dirs:
	mkdir -p bin

bin/%: c/%_solution.c
	$(CC) $(CFLAGS) $< -o $@

run_all: all
	@echo "Running C programs:"
	for p in $(C_PROGS); do echo "-- $$p --"; ./$$p || true; done
	@echo "\nRunning Python scripts:"
	for s in $(PY_SCRIPTS); do echo "-- $$s --"; python3 $$s || true; done

clean:
	rm -rf bin

pytest:
	@echo "Running Python pytest..."
	pytest -q python/tests
