
import re

def verify(isbn):
    isbn = isbn.replace("-", "")

    try:
        numbers = list(re.sub(r"[A-Z]", "", isbn[0:9]) + isbn[9:len(isbn)])
        numbers.reverse()
    except:
        return False

    if len(numbers) != 10 or numbers[0] not in list("123456789X"):
        return False

    result = 0
    for index, num in enumerate(numbers):
        print(index + 1)
        if num == 'X':
            result += (index + 1) * 10
        else:
            result += (index + 1) * int(num)

    return result % 11 == 0
