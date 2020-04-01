import 'dart:io';

const kAppName = 'My App';
const kAppVersion = '1.0.0';
const kDomainApi = 'http://yourdomain.com';

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
