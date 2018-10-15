def primitive_triplets(number_in_triplet):
    # find all solutions for prod of 2 numbers where prod = num/2
    pairs, triplets = [], []
    for i in range(1, number_in_triplet/2):
        if (number_in_triplet/2) % i == 0:
            pair = [i]
            pair.append((number_in_triplet/2)/i)
            pairs.append(pair)

    pairs = find_coprimes(pairs)

    for i in pairs:
        triplet = [number_in_triplet]
        triplet.append(i[1]**2 - i[0]**2)
        triplet.append(i[1]**2 + i[0]**2)
        triplet.sort()
        triplets.append(triplet)

    return triplets

def triplets_in_range(range_start, range_end):
    pass


def is_triplet(triplet):
    pass


def find_coprimes(pairs):
    for index, i in enumerate(pairs):
        if i[1] - i[0] % 2 == 0 or i[1] == i[0] or not is_coprime(i):
            pairs.pop(index)
    return pairs

def is_coprime(pair):
    for i in primes_up_to(range(2, pair[1] + 1)):
        if pair[1] % i == 0 and pair[0] % i == 0:
            return False
    return True

def primes_up_to(values, index = 0):
    if len(values) <= 1 or values[index] ** 2 > values[-1]:
        return values
    else:
        values = remove_multiples(values, index)
    return primes_up_to(values, index  + 1)

def remove_multiples(values, index):
    return [x for x in values if x == values[index] or x % values[index] != 0]
