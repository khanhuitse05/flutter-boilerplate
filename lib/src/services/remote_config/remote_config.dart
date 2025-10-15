import 'package:myapp/src/config/devices/app_info.dart';
import 'package:version/version.dart';

class RemoteConfig {
  final Version forceVersion;
  final Version appVersion;

  RemoteConfig({required this.forceVersion, required this.appVersion});

  factory RemoteConfig.ds() {
    final version = Version.parse(AppInfo.package.version);
    return RemoteConfig(forceVersion: version, appVersion: version);
  }

  bool get needForceUpdate => forceVersion > appVersion;

  bool get isNewVersion => appVersion > forceVersion;

  factory RemoteConfig.fromConfig(String versionString) {
    final version = Version.parse(versionString);
    return RemoteConfig(
      forceVersion: version,
      appVersion: Version.parse(AppInfo.package.version),
    );
  }
}
