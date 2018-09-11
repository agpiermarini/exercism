def distance(strand_a, strand_b):
    count = 0
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands are not the same length")
    for index, letter in enumerate(strand_a):
        if letter != strand_b[index]:
            count += 1
    return count
