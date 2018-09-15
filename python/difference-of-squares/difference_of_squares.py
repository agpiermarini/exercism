def square_of_sum(count):
    return reduce_array(range(1, count + 1)) ** 2

def sum_of_squares(count):
    squares = list(map(lambda x: x ** 2, range(1, count + 1)))
    return reduce_array(squares)

def reduce_array(array):
    return reduce(lambda x, y: x + y, array)

def difference(count):
    return square_of_sum(count) - sum_of_squares(count)
