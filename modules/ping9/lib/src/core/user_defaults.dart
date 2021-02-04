import 'package:shared_preferences/shared_preferences.dart';

class UserDefaults {
  factory UserDefaults() => instance;

  UserDefaults._internal();

  static final UserDefaults instance = UserDefaults._internal();

  static const String storageDomain = "my_app_storage_key";

  SharedPreferences preferences;

  Future initAsync() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future setObject(String keyName, Object keyValue) async {
    final preferences = await SharedPreferences.getInstance();

    switch (keyValue.runtimeType) {
      case String:
        return preferences.setString(storageDomain + keyName, keyValue);
      case int:
        return preferences.setInt(storageDomain + keyName, keyValue);
      case bool:
        return preferences.setBool(storageDomain + keyName, keyValue);
      case double:
        return preferences.setDouble(storageDomain + keyName, keyValue);
      case List:
        return preferences.setStringList(storageDomain + keyName, keyValue);
    }
  }

  dynamic getObjectByKey(String keyName) {
    return preferences.get(storageDomain + keyName);
  }

  bool containsKey(String keyName) {
    return preferences.containsKey(storageDomain + keyName);
  }

  Future clearAll() async {
    await preferences.clear();
  }

  Future clearObjectByKey(String keyName) async {
    await preferences.remove(storageDomain + keyName);
  }
}
