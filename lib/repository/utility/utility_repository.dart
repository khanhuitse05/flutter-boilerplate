import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:my_app/core/utility.dart';
import 'package:my_app/model/utility/device_info.dart';

class UtilityRepository {
  factory UtilityRepository() => instance;

  UtilityRepository._internal();

  static final UtilityRepository instance = UtilityRepository._internal();

  Future<DeviceInfo> getDeviceInfo() async {
    try {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final DeviceInfo myDevice = DeviceInfo();
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
        myDevice
          ..platformName = info.version.baseOS
          ..platformVersion = info.version.release
          ..uid = info.androidId
          ..name = info.device;
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
        myDevice
          ..platformName = info.systemName
          ..platformVersion = info.systemVersion
          ..uid = info.identifierForVendor
          ..name = info.name;
      }
      return myDevice;
    } catch (e) {
      log(e);
      return null;
    }
  }
}
