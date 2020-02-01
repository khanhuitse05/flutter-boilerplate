

import 'dart:io';

class GlobalConfig {

  static final GlobalConfig instance = GlobalConfig._internal();

  factory GlobalConfig() => instance;

  GlobalConfig._internal() {
    /// init
  }

  final appVersion = '1.0.0';
  final domain = 'http://yourdomain.com';


  static const dynamicLinkStore = 'https://[app_name].page.link/store';

  static get urlStore {
    if (Platform.isIOS) {
      return 'itms-apps://itunes.apple.com/app/[app_id]';
    } else {
      return 'https://play.google.com/store/apps/details?id=[app_id]';
    }
  }

  static get urlStoreReview {
    if (Platform.isIOS) {
      return "itms-apps://itunes.apple.com/app/id[app_id]?action=write-review";
    } else {
      return 'https://play.google.com/store/apps/details?id=[app_id]';
    }
  }
}