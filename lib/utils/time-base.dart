class TimeBase {
  int timestamp;

  TimeBase(this.timestamp);

  String getShowTime({int timestamp}) {
    int time;

    if (timestamp == null) {
      time = this.timestamp;
    } else {
      time = timestamp;
    }

    return getStandardDate(time);
  }

  static String getStandardDate(int timestamp) {
    String result = '';
    try {
      int now = (new DateTime.now().millisecondsSinceEpoch ~/ 1000);
      int diff = now - timestamp;
      int months = (diff ~/ (60 * 60 * 24 * 30));
      int days = (diff ~/ (60 * 60 * 24));
      int hours = ((diff - days * (60 * 60 * 24)) ~/ (60 * 60));
      int minutes = ((diff - days * (60 * 60 * 24) - hours * (60 * 60)) ~/ 60);
      if (months > 0) {
        result = months.toString() + '月前';
      } else if (days > 0) {
        result = days.toString() + '天前';
      } else if (hours > 0) {
        result = hours.toString() + '小时前';
      } else {
        result = minutes.toString() + '分钟前';
      }
    } catch (e) {
      e.toString();
    }
    return result;
  }
}
