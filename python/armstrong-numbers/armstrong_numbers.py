def is_armstrong(num):
    return sum([int(d) ** len(str(num)) for d in str(num)]) == num
