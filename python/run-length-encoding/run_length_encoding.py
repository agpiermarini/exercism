import re

def encode(string):
    groups  = re.findall("((.)\\2*)", string)
    combine = lambda i: f'{len(i[0])}{i[1]}' if len(i[0]) > 1 else i[1]
    return ''.join(list(map(combine, groups)))

def decode(string):
    characters = re.split('([a-zA-Z ])', string)
    decoded, multiplier = "", None
    for i in characters:
        try:
            multiplier = int(i)
        except:
            decoded += multiplier * i if multiplier else i
            multiplier = None
    return decoded

# def decode(string):
#     characters = ['1' if i == '' else i for i in re.split('([a-zA-Z ])', string)]
#     decoded, multiplier = "", None
#     for i in characters:
#         if multiplier:
#             decoded += multiplier * i
#             multiplier = None
#         else:
#             multiplier = int(i)
#     return decoded

# def decode(string):
#     characters = [1 if i == '' else i for i in re.split('([a-zA-Z ])', string)]
#     print(characters)

# def encode(string):
#     groups  = re.findall("((.)\\2*)", string)
#     return ''.join([f'{len(i[0])}{i[1]}' if len(i[0]) > 1 else i[1] for i in groups])

# def encode(string):
#     encoded, groups = '', re.findall("((.)\\2*)", string)
#     for i in groups:
#         encoded += f'{len(i[0])}{i[1]}' if len(i[0]) > 1 else i[1]
#     return encoded

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
