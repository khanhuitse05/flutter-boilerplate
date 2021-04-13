import 'package:shared_preferences/shared_preferences.dart';

class UserDefaults {
  factory UserDefaults() => instance;
  UserDefaults._internal();

  static final UserDefaults instance = UserDefaults._internal();

  static const String storageDomain = "my_app_storage_key";

  late SharedPreferences preferences;

  Future initAsync() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future setObject(String keyName, Object keyValue) async {
    final preferences = await SharedPreferences.getInstance();

    switch (keyValue.runtimeType) {
      case String:
        return preferences.setString(
            storageDomain + keyName, keyValue as String);
      case int:
        return preferences.setInt(storageDomain + keyName, keyValue as int);
      case bool:
        return preferences.setBool(storageDomain + keyName, keyValue as bool);
      case double:
        return preferences.setDouble(
            storageDomain + keyName, keyValue as double);
      case List:
        return preferences.setStringList(
            storageDomain + keyName, keyValue as List<String>);
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
