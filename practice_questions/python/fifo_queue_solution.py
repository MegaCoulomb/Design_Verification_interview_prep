# fifo_queue_solution.py
class FIFOQueue:
    def __init__(self):
        self.queue = []
    def enqueue(self, item):
        self.queue.append(item)
    def dequeue(self):
        if not self.queue: raise IndexError('dequeue from empty')
        return self.queue.pop(0)
    def peek(self):
        return self.queue[0] if self.queue else None

if __name__ == '__main__':
    q = FIFOQueue(); q.enqueue(1); q.enqueue(2); q.enqueue(3)
    print(q.dequeue()); q.enqueue(4); print(q.peek())
