def find_anagrams(word, candidates):
    return [x for x in candidates if is_anagram(word.lower(), x.lower())]

def is_anagram(first, second):
    return first != second and sorted(list(first)) == sorted(list(second))
