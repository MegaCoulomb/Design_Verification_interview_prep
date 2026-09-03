import pytest
from fifo_queue_solution import FIFOQueue

def test_fifo_basic():
    q = FIFOQueue()
    q.enqueue(1); q.enqueue(2); q.enqueue(3)
    assert q.dequeue() == 1
    q.enqueue(4)
    assert q.peek() == 2
