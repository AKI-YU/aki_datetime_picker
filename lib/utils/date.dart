import 'package:intl/intl.dart';

String dateToStr(DateTime d, {String f = 'yyyy-MM-dd'}) {
  DateFormat df = DateFormat(f);
  return df.format(d);
}

int getMonthDays(int year, int month) {
  switch (month) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return 31;
    case 2:
      if (year % 4 == 0) {
        return 29;
      } else {
        return 28;
      }
    default:
      return 30;
  }
}
