extension DateTimeExtensions on DateTime? {
  bool isSameDay(DateTime other) {
    if (this == null) return false;
    return this!.year == other.year && this!.month == other.month && this!.day == other.day;
  }

  bool isSameMonthYear(DateTime other) {
    return this!.year == other.year && this!.month == other.month;
  }

  bool isWeekend() {
    if (this == null) return false;
    return this!.weekday == DateTime.saturday || this!.weekday == DateTime.sunday;
  }

  String getInTimeFormat({bool showSeconds = false}) {
    return "${this?.hour}:${this?.minute}${showSeconds ? ':${this?.second}' : ''}";
  }
}