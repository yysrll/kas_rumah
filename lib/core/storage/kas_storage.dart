import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class KasStorage {
  final SharedPreferences _prefs;

  KasStorage(this._prefs);

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Clear All (Misal saat Logout)
  Future<bool> clearAll() async {
    return await _prefs.clear();
  }

  // Remove specific key
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
