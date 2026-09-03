# palindrome_solution.py
import re
def is_palindrome(s):
    s2 = re.sub(r'[^A-Za-z0-9]','', s).lower()
    return s2 == s2[::-1]

if __name__=='__main__': print(is_palindrome('racecar'))
