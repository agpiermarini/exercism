def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands are not the same length")
    return 0 if len(strand_a) == 0 else calculate_distance(strand_a, strand_b)

def calculate_distance(strand_a, strand_b, index = 0, length = 0):
    if strand_a[index] != strand_b[index]:
        length += 1
    return length if index + 1 == len(strand_a) else calculate_distance(strand_a, strand_b, index + 1, length)
