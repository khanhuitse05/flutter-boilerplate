import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:myapp/src/utils/utils.dart';

class XFirebaseMessage {
  factory XFirebaseMessage() => instance;
  XFirebaseMessage._internal();

  static final XFirebaseMessage instance = XFirebaseMessage._internal();
  static XFirebaseMessage get I => instance;

  String? currentToken;
  late Stream<String> _tokenStream;

  late FirebaseMessaging messaging;

  bool isNotificationsInitialized = false;

  Future<void> initialize() async {
    messaging = FirebaseMessaging.instance;
    _tokenStream = messaging.onTokenRefresh;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await setupNotification();

    registerTokenFCM();

    // NOTE: Request Permission doesn't necessarily implemented here.
    // You should follow the workflow of your project
    await requestPermission();
  }

  // NOTE: This function you must initialize Plugin Notification. For example:
  // - Awesome Notification:
  //  https://pub.dev/packages/awesome_notifications#-how-to-show-local-notifications
  // - Flutter Local Notification:
  //  https://firebase.flutter.dev/docs/messaging/notifications#foreground-notifications
  //
  //
  // NOTE: To set up for IOS, you can find the documentation
  // at https://firebase.flutter.dev/docs/messaging/apple-integration
  Future<void> setupNotification() async {
    if (isNotificationsInitialized) {
      return;
    }

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    configForegroundNotification();
    configOnMessageOpenApp();
    isNotificationsInitialized = true;
  }

  Future<void> requestPermission() async {
    try {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      xLog.i('User granted permission: ${settings.authorizationStatus}');
    } catch (e) {
      xLog.e(e);
    }
  }

  void configForegroundNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showLocalNotification(message);
      }
    });
  }

  Future<void> configOnMessageOpenApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      xLog.i("onMessageOpenedApp: ${json.encode(message.data)}");
      //TODO: Implement handle notification when app is opening.
    });
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    await XFirebaseMessage().setupNotification();

    XFirebaseMessage().showLocalNotification(message);
  }

  Future<void> showLocalNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      //TODO: Implement show notification
    }
  }

  void registerTokenFCM() async {
    // If you want to get a token from the web, you can find the documentation
    // at https://firebase.flutter.dev/docs/messaging/usage/#web-tokens
    messaging.getToken().then((setToken)).onError((error, stackTrace) {
      xLog.e(error);
    });

    _tokenStream.listen(setToken);
  }

  Future<void> unregisterTokenFCM() async {
    await messaging.deleteToken().catchError((error) {
      xLog.e(error);
    });
  }

  void setToken(String? token) {
    xLog.i('FCM Token: $token');
    if (token != null) {
      currentToken = token;
    }
  }

  Future<void> subscribeTopics(String topic) async {
    await messaging.subscribeToTopic(topic);
  }

  Future<void> unSubscribeTopics(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
  }
}
