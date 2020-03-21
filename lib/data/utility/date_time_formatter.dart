class DateTimeFormatter {
  static String formatDate(DateTime dateTime) {
    return dateTime.day.toString() + '.' + dateTime.month.toString() + '.' + dateTime.year.toString();
  }

  static String formatTime(DateTime dateTime) {
    return dateTime.hour.toString() + ':' + dateTime.minute.toString();
  }
}