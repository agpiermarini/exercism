from time import strptime
from datetime import date
from calendar import monthrange

def meetup_day(yr, mnth, day, which):
    try:
        for i in date_range(yr, mnth, which):
            if date(yr, mnth, i).weekday() == strptime1(day, "%A").tm_wday:
                return date(yr, mnth, i)
    except:
        raise MeetupDayException("No such date")

def date_range(yr, mnth, which):
    max = monthrange(yr, mnth)[1]
    return range(max - 6, max + 1) if which == "last" else DATE_RANGE[which]

class MeetupDayException(Exception):
    pass

DATE_RANGE = {
        "1st": range(1, 8),
        "2nd": range(8, 15),
        "3rd": range(15, 22),
        "4th": range(22, 29),
        "5th": range(29, 31),
        "teenth": range(13, 20)
    }
