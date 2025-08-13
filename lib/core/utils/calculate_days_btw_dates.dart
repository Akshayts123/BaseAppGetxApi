int calculateDaysBetween(DateTime? date1, DateTime? date2) {
  // Check if either date1 or date2 is null
  if (date1 == null || date2 == null) {
    return 1;
  }

  // Ensure date1 is always the smaller date
  DateTime startDate = date1.isBefore(date2) ? date1 : date2;
  DateTime endDate = date1.isBefore(date2) ? date2 : date1;

  // Calculate the difference between end date and start date
  Duration difference = endDate.difference(startDate);

  // Convert the difference into days (Duration class has a property 'inDays')
  return difference.inDays + 1;
}
