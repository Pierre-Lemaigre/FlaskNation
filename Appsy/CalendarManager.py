from datetime import date, timedelta, datetime


class CalendarManager:

    NB_HOURS_DAY = 24
    NB_WEEKS_YEAR = 52

    def __init__(self):
        self.today = date(datetime.now().year, datetime.now().month, datetime.now().day)
        self.day_offset = 0
        self.week_offset = 0

    def get_today(self):
        self.day_offset = 0
        return self.today

    def get_next_day(self):
        self.day_offset = self.day_offset + 1
        return self.today + timedelta(hours=CalendarManager.NB_HOURS_DAY * self.day_offset)

    def get_day_before(self):
        self.day_offset = self.day_offset - 1
        return self.today + timedelta(hours=CalendarManager.NB_HOURS_DAY * self.day_offset)

    def get_day_offset(self):
        return self.day_offset

    def get_week(self):
        self.week_offset = 0
        return self.today.isocalendar()[1]

    def get_next_week(self):
        self.week_offset = self.week_offset + 1
        return (self.today.isocalendar()[1] + self.week_offset) % CalendarManager.NB_WEEKS_YEAR

    def get_week_before(self):
        self.week_offset = self.week_offset - 1
        return (self.today.isocalendar()[1] + self.week_offset) % CalendarManager.NB_WEEKS_YEAR

    def get_week_offset(self):
        return self.week_offset
