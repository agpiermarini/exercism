import math

def prime_factors(natural_number, primes = [], factors = [], index = 0):
    if len(primes) == 0:
        primes  = primes_up_to(xrange(2, natural_number + 1))
        factors = []

    if len(primes) == 0 or index == len(primes):
        return factors
    elif natural_number % primes[index] == 0:
        natural_number /= primes[index]
        factors.append(primes[index])
        return prime_factors(natural_number, primes, factors, index)

    if natural_number == 1:
        return factors
    else:
        return prime_factors(natural_number, primes, factors, index + 1)

def primes_up_to(values, index = 0):
    if len(values) <= 1 or values[index] ** 2 > values[-1]:
        return values
    else:
        values = remove_multiples(values, index)
    return primes_up_to(values, index  + 1)

def remove_multiples(values, index):
    return [x for x in values if x == values[index] or x % values[index] != 0]
