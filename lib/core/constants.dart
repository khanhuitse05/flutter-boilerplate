import 'package:package_info/package_info.dart';

class Constants {
  static PackageInfo kPackageInfo;

  static Future initAsync() async {
    kPackageInfo = await PackageInfo.fromPlatform();
  }

  static String get kAppName => kPackageInfo.appName ?? 'My App';

  static String get kAppVersion => kPackageInfo.version;
}
