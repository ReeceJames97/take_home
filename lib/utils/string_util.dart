class StringUtil{
  static String splitDateString(String originalString){
    var parts = originalString.split(' ');
    var time = parts[1].trim();
    return time;
  }
}