import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static final StorageManager instance = StorageManager._internal();

  factory StorageManager() => instance;

  StorageManager._internal() {
    /// init
  }
  static const String storageDomain = "my_app_storage_key";


  static setObject(String keyName, dynamic keyValue) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    switch(keyValue.runtimeType)
    {
      case String:
        pref.setString(storageDomain + keyName, keyValue);
        break;
      case int:
        pref.setInt(storageDomain + keyName, keyValue);
        break;
      case bool:
        pref.setBool(storageDomain + keyName, keyValue);
        break;
      case double:
        pref.setDouble(storageDomain + keyName, keyValue);
        break;
      case List:
        pref.setStringList(storageDomain + keyName, keyValue);
        break;
    }
  }


  static dynamic getObjectByKey(String keyName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(storageDomain + keyName);
  }

  static containsKey(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(storageDomain + keyName);
  }

  static clearAll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  static clearObjectByKey(String keyName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(storageDomain + keyName);
  }
}
