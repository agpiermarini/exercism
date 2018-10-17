def primitive_triplets(number_in_triplet):
    pairs, triplets = [], []
    for i in range(1, number_in_triplet/2):
        if (number_in_triplet/2) % i == 0:
            pair = [i, (number_in_triplet/2)/i]
            pair.sort()
            if pair not in pairs:
                pairs.append(pair)

    filter_noncoprimes(pairs)

    for i in pairs:
        a, c = abs(i[1]**2 - i[0]**2), i[1]**2 + i[0]**2
        triplet = [a, number_in_triplet, c]
        triplet.sort()
        triplets.append(tuple(triplet))

    return set(triplets)

def triplets_in_range(range_start, range_end):
    pass


def is_triplet(triplet):
    pass


def filter_noncoprimes(pairs, i = 0):
    if i == len(pairs):
        return pairs
    elif pairs[i][1] - pairs[i][0] % 2 == 0 or pairs[i][1] == pairs[i][0] or not is_coprime(pairs[i]):
        del pairs[i]
        filter_noncoprimes(pairs, i)
    else:
        filter_noncoprimes(pairs, i + 1)

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
