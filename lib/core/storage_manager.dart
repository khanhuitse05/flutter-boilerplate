import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  factory StorageManager() => instance;

  StorageManager._internal();

  static final StorageManager instance = StorageManager._internal();
  static const String storageDomain = "my_app_storage_key";

  Future setObject(String keyName,dynamic keyValue) async {
    final preferences = await SharedPreferences.getInstance();

    switch (keyValue.runtimeType) {
      case String:
        await preferences.setString(storageDomain + keyName, keyValue);
        break;
      case int:
        await preferences.setInt(storageDomain + keyName, keyValue);
        break;
      case bool:
        await  preferences.setBool(storageDomain + keyName, keyValue);
        break;
      case double:
        await  preferences.setDouble(storageDomain + keyName, keyValue);
        break;
      case List:
        await preferences.setStringList(storageDomain + keyName, keyValue);
        break;
    }
  }

  Future<dynamic> getObjectByKey(String keyName) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.get(storageDomain + keyName);
  }

  Future<bool> containsKey(String keyName) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(storageDomain + keyName);
  }

  Future clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future clearObjectByKey(String keyName) async {
    final  preferences = await SharedPreferences.getInstance();
    await preferences.remove(storageDomain + keyName);
  }
}
