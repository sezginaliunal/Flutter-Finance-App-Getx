import 'package:intl/intl.dart';

String customFormattedDate(DateTime dateTime) {
  final firstDay = DateTime(dateTime.year, dateTime.month, 1);
  final lastDay = DateTime(dateTime.year, dateTime.month + 1, 0);
  final formattedDate =
      '${firstDay.day.toString().padLeft(2, '0')}-${lastDay.day.toString().padLeft(2, '0')} ${DateFormat('MMMM').format(dateTime)}';
  return formattedDate;
}

String formatMonthYear(DateTime dateTime) {
  return DateFormat('MMMM y', 'tr_TR').format(dateTime);
}

String formatOnlyDay(DateTime dateTime) {
  return DateFormat('dd', 'tr_TR').format(dateTime);
}
String formatDayName(DateTime dateTime) {
  return DateFormat('EEEE', 'tr_TR').format(dateTime);
}
