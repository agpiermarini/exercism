import math

def primitive_triplets(b):
    check_b(b)
    mn_pairs = calculate_mn_pairs(b)
    return primitives_for(mn_pairs, b)

def triplets_in_range(range_start, range_end):
    triplets = set()
    for i in range(range_start, range_end + 1):
        for j in range(i, range_end + 1):
            k = math.sqrt(i**2 + j**2)
            if k.is_integer() and range_start <= k <= range_end:
                triplets.add((i,j,k))
    return triplets

def is_triplet(triplet):
    triplet_list = sorted(triplet)
    return triplet_list[0]**2 + triplet_list[1]**2 == triplet_list[2]**2

def calculate_mn_pairs(b):
    pairs = [sorted((i, (b/2)/i)) for i in range(1, b/2) if (b/2) % i == 0]
    return filter_noncoprimes(pairs)

def primitives_for(pairs, b):
    triplets = set()
    for i in filter_noncoprimes(pairs):
        a, c = abs(i[0]**2 - i[1]**2), i[0]**2 + i[1]**2
        triplet = (a, b, c) if b > a else (b, a, c)
        triplets.add(triplet)
    return triplets

def filter_noncoprimes(pairs):
    return [x for x in pairs if is_coprime(x)]

def is_coprime(pair):
    for i in find_primes(range(2, pair[1] + 1)):
        if pair[1] - pair[0] % 2 == 0 or pair[1] % i == 0 and pair[0] % i == 0:
            return False
    return True

def find_primes(values, index = 0):
    for i in values:
        values = [x for x in values if i == x or x % i != 0]
    return values

def check_b(b):
    if b % 4 != 0:
        raise ValueError("B must be divisible by four.")
