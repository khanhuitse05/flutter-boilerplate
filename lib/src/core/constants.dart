import 'package:package_info/package_info.dart';

class Constants {
  factory Constants() => instance;
  Constants._internal();
  static final Constants instance = Constants._internal();

  late PackageInfo kPackageInfo;

  Future initAsync() async {
    kPackageInfo = await PackageInfo.fromPlatform();
  }

  String get kAppName => kPackageInfo.appName;

  String get kAppVersion => kPackageInfo.version;
}
