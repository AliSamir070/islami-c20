import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _pref;
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setBool({required key, required value}) async {
  await  _pref.setBool(key, value);
  }
  static bool? getBool({required key, })  {
   return _pref.getBool(key);
  }
}
