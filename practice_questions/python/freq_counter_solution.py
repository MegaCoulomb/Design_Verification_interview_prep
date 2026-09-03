# freq_counter_solution.py
import re
from collections import Counter
def word_freq(text):
    words = re.findall(r"\w+", text.lower())
    return Counter(words)

if __name__=='__main__':
    print(word_freq('This is a test. This test is simple.'))
