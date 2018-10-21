import string

def hey(phrase):
    phrase = ' '.join(phrase.split())
    upcase = phrase.upper()
    if phrase == "":
        return "Fine. Be that way!"
    elif phrase[-1] == "?":
        if phrase == upcase and has_letters(upcase):
            return "Calm down, I know what I'm doing!"
        else:
            return "Sure."
    elif phrase == upcase and has_letters(upcase):
        return "Whoa, chill out!"
    else:
        return "Whatever."

def has_letters(phrase):
    return len(set(phrase) - set(string.ascii_uppercase)) < len(set(phrase))
