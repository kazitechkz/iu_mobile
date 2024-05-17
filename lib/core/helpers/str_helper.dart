class StrHelper {
  static String beautifulInteger(int stat) {
    String outputString = stat.toString();
    if (stat > 1000) {
      outputString = (stat / 1000).toString() + "k";
    }
    if (stat > 10000000) {
      outputString = (stat / 1000).toString() + "M";
    }
    return outputString;
  }

  static String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  static String toHourMinutesSeconds(int time, int timeLeft){
    int difference = time - timeLeft;
    Duration duration = Duration(milliseconds: difference);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
