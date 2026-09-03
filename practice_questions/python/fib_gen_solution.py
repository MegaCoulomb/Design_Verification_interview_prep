# fib_gen_solution.py
def fib():
    a,b = 0,1
    while True:
        yield a
        a,b = b, a+b

if __name__=='__main__':
    f = fib()
    for _ in range(10): print(next(f))
