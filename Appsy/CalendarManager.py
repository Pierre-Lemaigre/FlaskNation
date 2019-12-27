from datetime import date, timedelta, datetime


class CalendarManager:

    def __init__(self):
        self.today = date(datetime.now().year, datetime.now().month, datetime.now().day)
        self.day_offset = 0

    def get_today(self):
        self.day_offset = 0
        return self.today

    def get_next_day(self):
        self.day_offset = self.day_offset + 1
        return self.today + timedelta(hours=24 * self.day_offset)

    def get_day_before(self):
        self.day_offset = self.day_offset - 1
        return self.today + timedelta(hours=24 * self.day_offset)

    def get_day_offset(self):
        return self.day_offset
