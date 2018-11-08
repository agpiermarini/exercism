def rotate(text, key):
    new_text = ""
    for i in text:
        new_value = ord(i) + key
        if 122 > ord(i) < 65:
            new_text += i
        elif i.isupper():
            if new_value > 90:
                new_text += chr(65 + (new_value - 91))
            else:
                new_text += chr(new_value)
        else:
            if new_value > 122:
                new_text += chr(97 + (new_value - 123))
            else:
                new_text += chr(new_value)
    return new_text
