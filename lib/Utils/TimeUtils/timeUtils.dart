import 'package:intl/intl.dart';
import 'package:persian_date/persian_date.dart';
import 'package:persian_datepicker/persian_datetime.dart';

class TimeUtils {
  static int JalaliToMilliseconds(String jalaliDate) {
    PersianDateTime persianDate1 = PersianDateTime(jalaaliDateTime: jalaliDate); // default is now
    var millisecondsSinceEpoch = persianDate1.datetime.millisecondsSinceEpoch;
    return millisecondsSinceEpoch;
  }

  static int JalaliToUnix(String jalaliDate) {
    jalaliDate = jalaliDate.replaceAll("-", "/");
    PersianDateTime persianDate1 = PersianDateTime(jalaaliDateTime: jalaliDate); // default is now
    var millisecondsSinceEpoch = persianDate1.datetime.millisecondsSinceEpoch ~/ 1000;
    return millisecondsSinceEpoch;
  }

  static String MiliSecondToJalaliOnlyDate(int mls) {
    DateTime dateTime = new DateTime.fromMicrosecondsSinceEpoch((mls * 1000));
    PersianDate pDate = PersianDate(gregorian: DateFormat('yyyy-MM-dd').format(dateTime));

    String jalaliDate = "${pDate.year}-${pDate.month}-${pDate.day}";
    jalaliDate = jalaliDate.replaceAll("-", "/");
    return jalaliDate;
  }

  static String MiliSecondToJalaliNamedDateAndTime(int mls) {
    DateTime dateTime = new DateTime.fromMicrosecondsSinceEpoch((mls * 1000000));
    PersianDate pDate = PersianDate(gregorian: DateFormat('yyyy-MM-dd HH:mm').format(dateTime));

    String jalaliDate = "${pDate.day} ${pDate.monthname} ${pDate.year} ساعت ${pDate.minute} : ${pDate.hour}";
    jalaliDate = jalaliDate.replaceAll("-", "/");
    return jalaliDate;
  }

  static String MiliSecondToJalaliNamedDate(int mls) {
    DateTime dateTime = new DateTime.fromMicrosecondsSinceEpoch((mls * 1000000));
    PersianDate pDate = PersianDate(gregorian: DateFormat('yyyy-MM-dd HH:mm').format(dateTime));

    String jalaliDate = "${pDate.monthname} ${pDate.year}";
    jalaliDate = jalaliDate.replaceAll("-", "/");
    return jalaliDate;
  }

  static String UnixToJalaliOnlyDate(int mls) {
    DateTime dateTime = new DateTime.fromMicrosecondsSinceEpoch((mls * 1000000));
    PersianDate pDate = PersianDate(gregorian: DateFormat('yyyy-MM-dd').format(dateTime));

    String day = pDate.day.toString();
    String month = pDate.month.toString();
    String jalaliDate = "${pDate.year}-$month-$day";
    jalaliDate = jalaliDate.replaceAll("-", "/");
    return jalaliDate;
  }

  static String CalculateAge(int mls) {
    DateTime dateTime = new DateTime.fromMicrosecondsSinceEpoch((mls * 1000000));
    DateTime dateTime2 = new DateTime.now();
    return (dateTime2.difference(dateTime).inDays / 365).round().toString();
  }
}
