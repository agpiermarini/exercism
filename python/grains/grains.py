def on_square(integer_number):
    if integer_number <= 0 or integer_number > 64:
        raise ValueError("Integer must be between 1 and 64")
    else:
        return reduce(lambda x, y: x * 2, range(1, integer_number + 1))

def total_after(integer_number):
    if integer_number <= 0 or integer_number > 64:
        raise ValueError("Integer must be between 1 and 64")
    else:
        board = [1]
        for i, value in enumerate(range(1, integer_number + 1)):
            board.append(board[i] * 2)
        return board[-1]
