from functools import reduce

YACHT = 'scoreYacht'
ONES = 'scoreOnes'
TWOS = 'scoreTwos'
THREES = 'scoreThrees'
FOURS = 'scoreFours'
FIVES = 'scoreFives'
SIXES = 'scoreSixes'
FULL_HOUSE = 'scoreFullHouse'
FOUR_OF_A_KIND = 'scoreFourOfAKind'
LITTLE_STRAIGHT = 'scoreLittleStraight'
BIG_STRAIGHT = 'scoreBigStraight'
CHOICE = 'scoreChoice'


def score(dice, category):
    dispatcher = {
                  'scoreYacht':scoreYacht(dice),
                  'scoreOnes':scoreSingles(dice, 1),
                  'scoreTwos':scoreSingles(dice, 2),
                  'scoreThrees':scoreSingles(dice, 3),
                  'scoreFours':scoreSingles(dice, 4),
                  'scoreFives':scoreSingles(dice, 5),
                  'scoreSixes':scoreSingles(dice, 6),
                  'scoreFullHouse':scoreFullHouse(dice),
                  'scoreFourOfAKind':scoreFourOfAKind(dice),
                  'scoreLittleStraight':scoreStraight(dice, 1, 6),
                  'scoreBigStraight':scoreStraight(dice, 2, 7),
                  'scoreChoice':sumElements(dice)
                  }
    return dispatcher[category]


def scoreYacht(dice):
    result = list(filter(lambda x: x == dice[0], dice))
    return 50 if len(result) == 5 else 0

def scoreSingles(dice, value):
    result = list(filter(lambda x: x == value, dice))
    return sumElements(result)

def scoreFullHouse(dice):
    tally = tallyDice(dice)
    return sumElements(dice) if list(tally.values()) == [2, 3] else 0

def scoreFourOfAKind(dice):
    tally = tallyDice(dice)
    for k, v in tally.items():
        return k * 4 if v == 4 or v == 5 else 0

def scoreStraight(dice, start, end):
    return 30 if sorted(dice) == list(range(start, end)) else 0

def sumElements(list):
    return reduce(lambda x, y: x + y, list) if len(list) > 0 else 0

def tallyDice(dice):
    tally = {}
    for i in dice:
        tally[i] = tally.get(i, 0) + 1
    return tally
