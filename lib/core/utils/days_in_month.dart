int getDaysInMonth(DateTime date) {
  int year = date.year;
  int month = date.month;

  // Move to the next month, then subtract a day to get the last day of the current month
  var nextMonth = (month % 12) + 1;
  var nextMonthYear = month == 12 ? year + 1 : year;
  var lastDayOfCurrentMonth =
      DateTime(nextMonthYear, nextMonth, 1).subtract(const Duration(days: 1));

  return lastDayOfCurrentMonth.day;
}
