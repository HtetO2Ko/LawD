import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtils {
  static final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();

  // Save value
  static Future<void> putString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getString(String key, {String defValue = ''}) async {
    final str = await _secureStorage.read(key: key);
    return str ?? defValue;
  }

  // Delete value
  static Future<void> remove(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Clear all secure data
  static Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }

  // Check if key exists
  static Future<bool> containsKey(String key) async {
    return await _secureStorage.containsKey(key: key);
  }
}
