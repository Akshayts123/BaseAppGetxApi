import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateRangeExtension on DateTimeRange {
  String get string {
    final startDate = DateFormat("dd-MM-yyyy").format(start);
    final endDate = DateFormat("dd-MM-yyyy").format(end);
    return "$startDate to $endDate";
  }
}
