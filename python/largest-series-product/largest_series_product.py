def largest_product(series, size, largest = 0):
    if size > len(series) or size <= 0:
        return special_case(size)
    for i, value in enumerate(series):
        if len(series[i:i + size]) != size:
            return largest
        else:
            product = reduce_substring(series[i:i + size], size)
            if product > largest:
                largest = product

def reduce_substring(series, size):
    return reduce(lambda x, y: int(x) * int(y), list(series))

def special_case(size):
    return 1 if size == 0 else error()

def error():
    raise ValueError("Size must be greater than zero and smaller than the length of the series")
