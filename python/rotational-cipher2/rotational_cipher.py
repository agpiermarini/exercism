import string

# case insensitive rotational cipher
# def rotate(text, key):
#     letters = string.ascii_uppercase + string.ascii_lowercase
#     rotated = letters[key:] + letters[:key]
#     encode  = lambda x: rotated[letters.find(x)] if x.isalpha() else x
#     return "".join(map(encode, text))
#
# case sensitive rotational cipher using list rotation
# def rotate(text, key):
#     uppers, lowers = string.ascii_uppercase, string.ascii_lowercase
#     uppers_rotated, lowers_rotated = uppers[key:] + uppers[:key], lowers[key:] + lowers[:key]
#
#     new_text = ""
#
#     for i in text:
#         if i.isupper():
#             new_text += uppers_rotated[uppers.find(i)]
#         elif i.islower():
#             new_text += lowers_rotated[lowers.find(i)]
#         else:
#             new_text += i
#
#     return new_text

# case insensitive rotational cipher using list rotation
def rotate(text, key):
    letters = string.ascii_lowercase
    rotated = letters[key:] + letters[:key]

    new_text = ""

    for i in text:
        if i.isalpha():
            letter = rotated[letters.find(i.lower())]
            new_text += letter if i.islower() else letter.upper()
        else:
            new_text += i

    return new_text
