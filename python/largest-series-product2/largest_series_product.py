def largest_product(series, size, i  = 0, largest = 0):
    if size > len(series) or size <= 0:
        return special_case(size)
    elif len(series[i:i + size]) == size:
        product = reduce_substring(series[i:i + size], size)
        if product > largest:
            largest = product
        return largest_product(series, size, i + 1, largest)
    else:
        return largest

def reduce_substring(series, size):
    return reduce(lambda x, y: int(x) * int(y), list(series))

def special_case(size):
    return 1 if size == 0 else error()

def error():
    raise ValueError("Size must be greater than zero and smaller than the length of the series")
