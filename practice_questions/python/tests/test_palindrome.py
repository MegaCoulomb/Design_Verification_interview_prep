from palindrome_solution import is_palindrome
def test_pal():
    assert is_palindrome('racecar')
    assert is_palindrome('A man, a plan, a canal: Panama')
    assert not is_palindrome('hello')
