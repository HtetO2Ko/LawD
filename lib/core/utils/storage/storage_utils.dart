import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static StorageUtils? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageUtils?> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtils._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtils._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // remove
  static Future<bool>? remove(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  // set string
  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  // clear all
  static Future<bool>? clrAll() {
    SharedPreferences prefs = _preferences!;
    return prefs.clear();
  }
}
