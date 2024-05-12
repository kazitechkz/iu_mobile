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
}
