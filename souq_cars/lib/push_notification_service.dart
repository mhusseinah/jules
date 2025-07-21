import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // User granted permission
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      // User granted provisional permission
    } else {
      // User declined or has not accepted permission
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
    });
  }
}
