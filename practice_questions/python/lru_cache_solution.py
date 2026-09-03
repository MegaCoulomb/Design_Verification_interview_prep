# lru_cache_solution.py
from collections import OrderedDict
class LRUCache:
    def __init__(self, capacity):
        self.cap = capacity; self.od = OrderedDict()
    def get(self, key):
        if key not in self.od: return -1
        self.od.move_to_end(key); return self.od[key]
    def put(self, key, value):
        if key in self.od: self.od.move_to_end(key)
        self.od[key]=value
        if len(self.od)>self.cap: self.od.popitem(last=False)

if __name__=='__main__':
    c=LRUCache(2); c.put(1,1); c.put(2,2); print(c.get(1)); c.put(3,3); print(c.get(2))
