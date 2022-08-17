import 'package:shared_preferences/shared_preferences.dart';

class chTheme {
  void setTheme(bool The) async {
    var shr = await SharedPreferences.getInstance();
    shr.setBool("Theme", The);
  }

  Future<bool?> getTheme() async {
    var shr = await SharedPreferences.getInstance();
    return shr.getBool("Theme");

  }
}
