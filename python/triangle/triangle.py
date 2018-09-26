def is_equilateral(sides):
    return check_sides(sides, [1])


def is_isosceles(sides):
    return check_sides(sides, [1,2])


def is_scalene(sides):
    return check_sides(sides, [3])


def check_sides(sides, unique_sides):
    sides.sort()
    return sides[0] != 0 and \
        (sides[0] + sides[1] >= sides[2]) and \
        len(set(sides)) in unique_sides
