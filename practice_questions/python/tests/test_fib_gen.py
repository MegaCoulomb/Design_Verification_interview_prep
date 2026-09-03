from fib_gen_solution import fib
def test_fib():
    g = fib()
    vals = [next(g) for _ in range(10)]
    assert vals[0]==0 and vals[1]==1 and vals[2]==1 and vals[3]==2
