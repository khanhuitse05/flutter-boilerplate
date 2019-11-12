//import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  static final AppAnalytics instance = AppAnalytics._internal();

  factory AppAnalytics() {
    return instance;
  }

  AppAnalytics._internal() {
//    firebase = FirebaseAnalytics();
  }

//  FirebaseAnalytics firebase;

  Future<void> setAnalyticsCollectionEnabled(bool enable) async {
//    await firebase.setAnalyticsCollectionEnabled(enable);
  }

  Future<void> logEvent(String action,
      {Map<String, dynamic> parameters}) async {
//    await firebase.logEvent(name: action, parameters: parameters);
  }
}
