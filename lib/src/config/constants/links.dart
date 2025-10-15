import 'dart:io';
import 'package:myapp/src/config/devices/app_Info.dart';

class XLink {
  static String get playStore =>
      'market://details?id=${AppInfo.package.packageName}';
  static String appStore = 'https://apps.apple.com/app/idTODO';
  static String get storeOf => Platform.isAndroid ? playStore : appStore;
}
