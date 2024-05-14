import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Goal {
  int count;
  int goal;
  Color color;
  DateTime? dueDate;
  Goal({this.count=0,this.goal=1,this.color=Colors.grey,this.dueDate});
}

class LCPUtils {
  static var moneyFormat = NumberFormat("##0.00", "en_US");
  static var numberFormat = NumberFormat("###", "en_US");

  static String toDate(DateTime? dt) {
    if(dt == null) return "";
    String y = dt.year.toString();
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    return "${y}-${m}-${d}";
  }
  static String toJsonUrlDate(DateTime? dt) {
    if(dt == null) return "";
    String y = dt.year.toString();
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    return "${y}-${m}-${d}T00:00:00%2b00:00";
  }
  static String? toJsonDateTime(DateTime? dt) {
    if(dt == null) return null;
    String y = dt.year.toString();
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    String h = twoDigit(dt.hour);
    String min = twoDigit(dt.minute);
    String sec = twoDigit(dt.second);
    String offset = "${twoDigit(dt.timeZoneOffset.inHours)}:00";
    if(dt.timeZoneOffset.inHours == 0)
      offset = "Z";
    return "${y}-${m}-${d}T${h}:${min}:${sec}${offset}";
  }
  static String toJsonUrlDateTime(DateTime? dt) {
    if(dt == null) return "";
    String json = toJsonDateTime(dt)!;
    json = json.replaceAll("+", "%2b");  //plus
    return json;
  }
  /** Retuns the jsonDate in UTC time. If you wish to convert the date to your local time use DateTime.toLocal(). */
  static DateTime? parseJsonDate(String? jsonDate) {
    if(jsonDate == null || jsonDate.length == 0 || jsonDate == "null")
      return null;

    if(jsonDate.indexOf("\[") != -1)
      jsonDate = jsonDate.substring(0,jsonDate.indexOf("\["));  //remove textual time zone
    return DateTime.parse(jsonDate);
  }

  static String formatMoney(double n) {
    return moneyFormat.format(n);
  }
  static String formatNumber(double n) {
    return numberFormat.format(n);
  }

  static String twoDigit(int n) {
    if(n<0) {
      if(n.toString().length < 3) {
        return "-0${n.abs()}";
      } else {
        return n.toString();
      }
    } else {
      if (n
          .toString()
          .length < 2)
        return '0$n';
      return n.toString();
    }
  }

  static String dateTimeFull(DateTime? dt) {
    if(dt == null) return "";
    String y = dt.year.toString();
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    String h = twoDigit(dt.hour);
    String min = twoDigit(dt.minute);
    String sec = twoDigit(dt.second);
    return "$m/$d/$y $h:$min:$sec";
  }

  static String dateTimeShort(DateTime? dt) {
    if(dt == null) return "";
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    String h = twoDigit(dt.hour);
    String min = twoDigit(dt.minute);
    String sec = twoDigit(dt.second);
    return "$m/$d $h:$min";
  }

  static String dateLong(DateTime? dt) {
    if(dt == null) return "";
    String y = dt.year.toString();
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    return "$m/$d/$y";
  }

  static String dateShort(DateTime? dt) {
    if(dt == null) return "";
    String m = twoDigit(dt.month);
    String d = twoDigit(dt.day);
    return "$m/$d";
  }

  static String timeOfDay(TimeOfDay? time) {
    if(time == null) return "";
    return "${time.hour}:${twoDigit(time.minute)}";
  }

  static bool isFirstDay(DateTime? date) {
    if(date != null) {
      return date.day == 1;
    }
    return false;
  }

  static bool isPast(DateTime? date) {
    if(date != null) {
      return dayOnly(date).millisecondsSinceEpoch < today().millisecondsSinceEpoch;
    }
    return false;
  }

  static bool isFuture(DateTime? date) {
    if(date != null) {
      return dayOnly(date).millisecondsSinceEpoch > today().millisecondsSinceEpoch;
    }
    return false;
  }

  static bool isToday(DateTime? date) {
    if(date != null) {
      return LCPUtils.today().day == date.day;
    }
    return false;
  }

  static DateTime yesterday() {
    return today().add(Duration(days:-1));
  }

  static DateTime today() {
    DateTime now = DateTime.now();
    return DateTime(now.year,now.month,now.day);
  }

  static DateTime dayOnly(DateTime date) {
    return DateTime(date.year,date.month,date.day);
  }

  static DateTime tomorrow() {
    return today().add(Duration(days:1));
  }
}
