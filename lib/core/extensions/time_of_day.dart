import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  // is after is a statement not a question
  bool isAfter(TimeOfDay secondTime) {
    return (secondTime.hour + (secondTime.minute / 60)) <
        (hour + (minute / 60));
  }

  bool isBefore(TimeOfDay secondTime) {
    return !isAfter(secondTime);
  }

  double difference(TimeOfDay secondTime) {
    return ((secondTime.hour + (secondTime.minute / 60)) - (hour + minute / 60))
        .abs();
  }

  String get string {
    return DateFormat.jm().format(DateTime(0, 0, 0, hour, minute));
  }

  String formatted() {
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }
}
