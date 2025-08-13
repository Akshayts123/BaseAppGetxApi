import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String string({String? hyphen = '-'}) {
    if (this == null) return "";
    return DateFormat("dd${hyphen}MM${hyphen}yyyy").format(this!);
  }

  String formattedDateTime() {
    if (this == null) return "";
    return DateFormat('hh:mm a dd MMM yyyy').format(this!);
  }

  DateTime? parseDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    return DateTime.tryParse(dateString);
  }



  bool get isToday {
    if (this == null) {
      return false;
    }
    final today = DateTime.now();
    return this!.day == today.day &&
        this!.month == today.month &&
        this!.year == today.year;
  }

  bool get isTomorrow {
    if (this == null) {
      return false;
    }
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return this!.day == tomorrow.day &&
        this!.month == tomorrow.month &&
        this!.year == tomorrow.year;
  }

  bool isSameDayAs(DateTime other) {
    if (this == null) {
      return false;
    }

    return this!.day == other.day &&
        this!.month == other.month &&
        this!.year == other.year;
  }

  DateTime get lastDayInMonth {
    DateTime nextMonth = this!.add(const Duration(days: 30));
    DateTime lastDay = nextMonth.subtract(Duration(days: nextMonth.day));
    return lastDay;
  }

  DateTime get firstDayInMonth {
    return this!.subtract(Duration(days: this!.day - 1));
  }
}
