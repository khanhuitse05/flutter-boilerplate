import 'dart:io';

// todo: update app ID
class AppLinks {
  static const kDynamicLinkStore = 'https://[app_name].page.link/store';

  static String get kUrlStore {
    if (Platform.isIOS) {
      return 'itms-apps://itunes.apple.com/app/[app_id]';
    } else {
      return 'https://play.google.com/store/apps/details?id=[app_id]';
    }
  }

  static String get kUrlStoreReview {
    if (Platform.isIOS) {
      return "itms-apps://itunes.apple.com/app/id[app_id]?action=write-review";
    } else {
      return 'https://play.google.com/store/apps/details?id=[app_id]';
    }
  }
}
