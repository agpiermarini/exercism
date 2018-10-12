def prime_factors(natural_number):
    primes, factors  = primes_up_to(xrange(2, natural_number + 1)), []

    for i in primes:
        while natural_number % i == 0:
            natural_number /= i
            factors.append(i)

        if natural_number == 1:
            return factors

    return factors

def primes_up_to(values, index = 0):
    if len(values) <= 1 or values[index] ** 2 > values[-1]:
        return values
    else:
        values = remove_multiples(values, index)
    return primes_up_to(values, index  + 1)

def remove_multiples(values, index):
    return [x for x in values if x == values[index] or x % values[index] != 0]
