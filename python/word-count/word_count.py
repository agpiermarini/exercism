import re

def word_count(phrase):
    count = {}
    for i in re.split(',| ', re.sub(r"[^\w']+", ' ', phrase.replace("_", " ").lower()).strip()):
        word = i.strip("'")
        count.setdefault(word, 0)
        count[word] += 1

    return count
