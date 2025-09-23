import 'package:intl/intl.dart';

final String dateFormatDDMMYYYY = 'dd/MM/yyyy';
final String dateFormatYYYYMMDD = 'yyyy-MM-dd';

class DateFormatter {
  static final DateFormat _dateFormatDDMMYYYY = DateFormat(dateFormatDDMMYYYY);

  static final DateFormat _dateFormatYYYYMMDD = DateFormat(dateFormatYYYYMMDD);

  static String formatDDMMYYYY(DateTime date) {
    return _dateFormatDDMMYYYY.format(date);
  }

  static DateTime parseDDMMYYYY(String dateString) {
    return _dateFormatDDMMYYYY.parse(dateString);
  }

  static String formatYYYYMMDD(DateTime date) {
    return _dateFormatYYYYMMDD.format(date);
  }

  static DateTime parseYYYYMMDD(String dateString) {
    return _dateFormatYYYYMMDD.parse(dateString);
  }
}
