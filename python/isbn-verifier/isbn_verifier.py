
import re

def verify(isbn):
    numbers = re.findall('[0-9A-Z]', isbn)

    if len(numbers) != 10:
        return False
    else:
        numbers.reverse()
        result = 0
        if numbers[0] == 'X':
            numbers[0] = '10'
        for index, num in enumerate(numbers):
            try:
                result += (index + 1) * int(num)
            except:
                return False

    return result % 11 == 0
