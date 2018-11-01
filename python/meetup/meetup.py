import time
from datetime import date
from calendar import monthrange

def meetup_day(year, month, day, which):
    try:
        for i in date_range(year, month, which):
            if date(year, month, i).weekday() == time.strptime(day, "%A").tm_wday:
                return date(year, month, i)
    except:
        raise MeetupDayException("No such date")

def date_range(year, month, which):
    if which == "last":
        last_day = monthrange(year, month)[1]
        return range(last_day - 6, last_day + 1)
    else:
        return DATE_RANGE[which]

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
