ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def is_pangram(sentence):
    for letter in ALPHABET:
        if letter not in sentence.lower():
            return False
    return True
