import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/src/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late DeviceInfo device;
  static late PackageInfo package;

  static Future initialize() async {
    await Future.wait([
      loadDevice(),
      loadPackage(),
    ]);
  }

  static Future loadDevice() async {
    try {
      final DeviceInfoPlugin plugin = DeviceInfoPlugin();
      if (kIsWeb) {
        WebBrowserInfo info = await plugin.webBrowserInfo;
        device = DeviceInfo(
          platformName: info.platform,
          platformVersion: info.appVersion,
          uid: info.appCodeName,
          name: info.appName,
          model: info.product,
          isPhysicalDevice: true,
        );
      } else if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await plugin.androidInfo;
        device = DeviceInfo(
          platformName: info.version.baseOS,
          platformVersion: info.version.release,
          uid: info.id,
          name: info.device,
          model: info.model,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await plugin.iosInfo;
        device = DeviceInfo(
          platformName: info.systemName,
          platformVersion: info.systemVersion,
          uid: info.identifierForVendor,
          name: info.name,
          model: info.model,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      }
    } catch (e) {
      device = DeviceInfo();
      xLog.e(e);
    }
  }

  static Future loadPackage() async {
    package = await PackageInfo.fromPlatform();
  }
}

class DeviceInfo {
  String? uid;
  String? name;
  String? platformName;
  String? platformVersion;
  String? model;
  bool isPhysicalDevice;
  DeviceInfo({
    this.isPhysicalDevice = true,
    this.uid,
    this.name,
    this.platformName,
    this.platformVersion,
    this.model,
  });
}
