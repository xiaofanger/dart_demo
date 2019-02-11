
class DateUtil {

  static getDate() {
    DateTime dateTime = new DateTime.now();
    StringBuffer stringBuffer = new StringBuffer();
    var year = dateTime.year;
    var month = dateTime.month;
    var day = dateTime.day;
    stringBuffer.write('$year年$month月$day日');
    return stringBuffer.toString();
  }

  static getDateTime() {
    DateTime dateTime = new DateTime.now();
    StringBuffer stringBuffer = new StringBuffer();
    var year = dateTime.year;
    var month = dateTime.month;
    var day = dateTime.day;
    var hour = dateTime.hour;
    var milli = dateTime.minute;
    var second = dateTime.second;
    stringBuffer.write('$year年$month月$day日 $hour时$milli分$second秒');
    return stringBuffer.toString();
  }

}