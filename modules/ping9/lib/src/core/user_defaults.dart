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
        await preferences.setString(storageDomain + keyName, keyValue);
        break;
      case int:
        await preferences.setInt(storageDomain + keyName, keyValue);
        break;
      case bool:
        await preferences.setBool(storageDomain + keyName, keyValue);
        break;
      case double:
        await preferences.setDouble(storageDomain + keyName, keyValue);
        break;
      case List:
        await preferences.setStringList(storageDomain + keyName, keyValue);
        break;
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
