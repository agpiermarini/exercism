def rotate(text, key):
    new_text = ""
    for i in text:
        val = ord(i) + key
        if i.isupper():
            new_text += chr(65 + (val % 91))  if val > 90  else chr(val)
        elif i.islower():
            new_text += chr(97 + (val % 123)) if val > 122 else chr(val)
        else:
            new_text += i
    return new_text
