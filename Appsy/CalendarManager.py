from datetime import date, timedelta, datetime


# Manage divers operations on dates
class CalendarManager:
    # Constants
    NB_HOURS_DAY = 24
    NB_WEEKS_YEAR = 52

    # Constructor
    def __init__(self):
        self.today = date(datetime.now().year, datetime.now().month, datetime.now().day)
        self.day_offset = 0
        self.week_offset = 0

    # Get today date
    def get_today(self):
        self.day_offset = 0
        return self.today

    # Get the day after today + day_offset
    def get_next_day(self):
        # Increment day_offset
        self.day_offset = self.day_offset + 1

        # Compute today + day_offset
        return self.today + timedelta(hours=CalendarManager.NB_HOURS_DAY * self.day_offset)

    # Get the day before today - day_offset
    def get_day_before(self):
        # Decrement day_offset
        self.day_offset = self.day_offset - 1

        # Compute today + day_offset
        return self.today + timedelta(hours=CalendarManager.NB_HOURS_DAY * self.day_offset)

    # Get current day_offset
    def get_day_offset(self):
        return self.day_offset

    # Get current weeks number
    def get_week(self):
        self.week_offset = 0
        return self.today.isocalendar()[1]

    # Get the weeks number after current week + week_offset
    def get_next_week(self):
        # Increment week_offset
        self.week_offset = self.week_offset + 1

        # Compute weeks number + week_offset
        return (self.today.isocalendar()[1] + self.week_offset) % CalendarManager.NB_WEEKS_YEAR

    # Get the weeks number before current week - week_offset
    def get_week_before(self):
        # Decrement week_offset
        self.week_offset = self.week_offset - 1

        # Compute weeks number + week_offset
        return (self.today.isocalendar()[1] + self.week_offset) % CalendarManager.NB_WEEKS_YEAR

    # Get current week_offset
    def get_week_offset(self):
        return self.week_offset
