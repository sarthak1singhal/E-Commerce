class Functions{
  static String capitalizeFirst(String s) {
    if (s.length > 1)
      return s[0].toUpperCase() + s.substring(1);
    else if (s.length == 1) {
      return s.toUpperCase();
    }
    return s;
  }



  static bool isNullEmptyOrFalse(Object o){
    bool d =  o == null || false == o || "" == o || 0 == o;

    return d;

  }

  
}