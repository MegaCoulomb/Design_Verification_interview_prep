# prod_cons_solution.py
import threading, time, queue

def producer(q):
    for i in range(5):
        q.put(i); print('prod',i); time.sleep(0.1)
def consumer(q):
    while True:
        item = q.get(); print('cons',item); q.task_done()

if __name__=='__main__':
    q = queue.Queue()
    t1 = threading.Thread(target=producer,args=(q,)); t2 = threading.Thread(target=consumer,args=(q,))
    t1.start(); t2.daemon=True; t2.start(); t1.join(); q.join()
