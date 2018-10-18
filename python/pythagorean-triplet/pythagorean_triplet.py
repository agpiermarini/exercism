import math

def primitive_triplets(b):
    pairs, triplets = [], set()

    for i in range(1, b/2):
        if (b/2) % i == 0:
            pair = sorted((i, (b/2)/i))
            pairs.append(pair)

    pairs = filter_noncoprimes(pairs)

    for i in pairs:
        a, c = abs(i[0]**2 - i[1]**2), i[0]**2 + i[1]**2
        triplet = (a, b, c) if b > a else (b, a, c)
        triplets.add(triplet)

    return triplets

def triplets_in_range(range_start, range_end):
    triplets = set()
    for i in range(range_start, range_end + 1):
        for j in range(i, range_end + 1):
            k = math.sqrt(i**2 + j**2)
            if k.is_integer() and range_start <= k <= range_end:
                triplets.add((i,j,k))
    return triplets

def is_triplet(triplet):
    trip_list = sorted(triplet)
    return trip_list[0]**2 + trip_list[1]**2 == trip_list[2]**2

def filter_noncoprimes(pairs):
    return [x for x in pairs if is_coprime(x)]

def is_coprime(pair):
    for i in primes_up_to(range(2, pair[1] + 1)):
        if pair[1] - pair[0] % 2 == 0 or pair[1] % i == 0 and pair[0] % i == 0:
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
