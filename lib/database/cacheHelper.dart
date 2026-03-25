import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? shared;

  static Future<void> init() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, String val) async {
    return await shared!.setString(key, val);
  }

  static getData(String key) {
    return shared!.get(key);
  }

  static Future<bool> removeData(String key) async {
    return await shared!.remove(key);
  }
}
