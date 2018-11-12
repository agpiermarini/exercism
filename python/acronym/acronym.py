import re
def abbreviate(words):
    return "".join(re.findall('[A-Z]', words.title()))
