import re

def decode(string):
    pass


# def encode(string):
#     letter, count, counts = '', 0, []
#     for i in string:
#         if i == letter:
#             count += 1
#         else:
#             counts.append([str(count) if count > 1 else '', letter])
#             letter, count = i, 1
#     counts.append([str(count) if count > 1 else '', letter])
#     return ''.join([y for x in counts for y in x])

def encode(string):
    encoded, groups = '', re.findall("((.)\\2*)", string)
    for i in groups:
        encoded += f'{len(i[0])}{i[1]}' if len(i[0]) > 1 else i[1]
    return encoded
