import math

def primitive_triplets(number_in_triplet):
    pairs, triplets = [], set()

    for i in range(1, number_in_triplet/2):
        if (number_in_triplet/2) % i == 0:
            pair = sorted((i, (number_in_triplet/2)/i))
            pairs.append(pair)

    filter_noncoprimes(pairs)

    for i in pairs:
        a, c = abs(i[0]**2 - i[1]**2), i[0]**2 + i[1]**2
        triplet = sorted((a, number_in_triplet, c))
        triplets.add(tuple(triplet))

    return triplets

def triplets_in_range(range_start, range_end):
    triplet_range, triplets = range(range_start, range_end + 1), set()
    for i in triplet_range:
        for j in triplet_range:
            k = math.sqrt(i**2 + j**2)
            if k.is_integer() and range_start <= k <= range_end:
                triplets.add(tuple(sorted((i, j, k))))
    return triplets

def is_triplet(triplet):
    trip_list = sorted(triplet)
    return trip_list[0]**2 + trip_list[1]**2 == trip_list[2]**2

def filter_noncoprimes(pairs, i = 0):
    if i == len(pairs):
        return pairs
    elif pairs[i][1] - pairs[i][0] % 2 == 0 or not is_coprime(pairs[i]):
        del pairs[i]
    else:
        i += 1
    filter_noncoprimes(pairs, i)

def is_coprime(pair):
    for i in primes_up_to(range(2, pair[1] + 1)):
        if pair[1] % i == 0 and pair[0] % i == 0:
            return False
    return True

def primes_up_to(values, index = 0):
    if len(values) <= 1 or values[index] ** 2 > values[-1]:
        return values
    remove_multiples(values, index)
    return primes_up_to(values, index  + 1)

def remove_multiples(values, index):
    return [x for x in values if x == values[index] or x % values[index] != 0]
