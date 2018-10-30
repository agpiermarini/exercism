def decode(string):
    pass


def encode(string):
    letter, count, counts = '', 0, []
    for i in string:
        if i == letter:
            count += 1
        else:
            counts.append([str(count) if count > 1 else '', letter])
            letter, count = i, 1
    counts.append([str(count) if count > 1 else '', letter])
    return ''.join([y for x in counts for y in x])
