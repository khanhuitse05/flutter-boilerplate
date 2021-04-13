import 'dart:io';
import 'package:intl/intl.dart';
import 'package:device_info/device_info.dart';
import 'package:my_app/models/shared/device_info.dart';
import 'package:my_app/src/utils/index.dart';

class Utility {
  static String formatPrice(Object number) {
    final oCcy = NumberFormat("#,###", "en_US");
    if (number is String) {
      if (number.toString().isNotEmpty) {
        final int value = int.parse(number);

        return oCcy.format(value);
      } else {
        return '';
      }
    } else {
      return oCcy.format(number);
    }
  }

  Future<DeviceInfo?> getDeviceInfo() async {
    try {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
        return DeviceInfo(
            platformName: info.version.baseOS,
            platformVersion: info.version.release,
            uid: info.androidId,
            name: info.device);
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
        return DeviceInfo(
            platformName: info.systemName,
            platformVersion: info.systemVersion,
            uid: info.identifierForVendor,
            name: info.name);
      }
    } catch (e) {
      printTrace(e);
    }
    return null;
  }
}
