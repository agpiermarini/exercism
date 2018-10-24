def sieve(limit):
    values = range(2, limit + 1)
    for i in values:
        values = [x for x in values if i == x or x % i != 0]

    return values
