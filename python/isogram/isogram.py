def is_isogram(string):
    letters = list(string.replace(" ", "").replace("-", "").lower())
    return len(letters) == len(set(letters))
