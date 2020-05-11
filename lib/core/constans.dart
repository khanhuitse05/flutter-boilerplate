import 'dart:io';

import 'package:package_info/package_info.dart';

const kDomainApi = 'http://yourdomain.com';

PackageInfo kPackageInfo;

String get kAppName => kPackageInfo.appName ?? 'MEC Health';

String get kAppVersion => kPackageInfo.version;

const kDynamicLinkStore = 'https://[app_name].page.link/store';

String get kUrlStore {
  if (Platform.isIOS) {
    return 'itms-apps://itunes.apple.com/app/[app_id]';
  } else {
    return 'https://play.google.com/store/apps/details?id=[app_id]';
  }
}

String get kUrlStoreReview {
  if (Platform.isIOS) {
    return "itms-apps://itunes.apple.com/app/id[app_id]?action=write-review";
  } else {
    return 'https://play.google.com/store/apps/details?id=[app_id]';
  }
}

class MyKey {
  static const String alreadyShowIntro = "alreadyShowIntro";
}
