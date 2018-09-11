def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands are not the same length")
    return calculate_distance(strand_a, strand_b)

def calculate_distance(strand_a, strand_b, index = 0, length = 0):
    if index >= len(strand_a):
        return length
    elif strand_a[index] != strand_b[index]:
        length += 1
    return calculate_distance(strand_a, strand_b, index + 1, length)
