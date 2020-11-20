import 'dart:io';

import 'package:package_info/package_info.dart';

class Constants {
  static const kDomainApi = 'http://yourdomain.com';

  static PackageInfo kPackageInfo;

  static Future initAsync() async {
    kPackageInfo = await PackageInfo.fromPlatform();
  }

  static String get kAppName => kPackageInfo.appName ?? 'MEC Health';

  static String get kAppVersion => kPackageInfo.version;
}
