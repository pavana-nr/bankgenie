import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences preferences;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static bool getLoggedInStatus() {
    return preferences.getBool("wasLoggedIn") ?? false;
  }

  static void setLoggedInStatus() async {
    preferences.setBool("wasLoggedIn", true);
  }

  static void removeLoggedOutStatus() async {
    preferences.remove("wasLoggedIn");
  }
}
