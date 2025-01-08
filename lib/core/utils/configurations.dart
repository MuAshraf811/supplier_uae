import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class Configurations {
  Configurations._();

  static Future<void> initializeFCM() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Get the APNs token for iOS
      String? apnsToken = await messaging.getAPNSToken();
      if (apnsToken != null) {
        log('APNs Token: $apnsToken');
      } else {
        log('APNs Token is not available yet.');
      }

      // Get the FCM token
      String? fcmToken = await messaging.getToken();
      if (fcmToken != null) {
        log('FCM Token: $fcmToken');
      } else {
        log('FCM Token is not available yet.');
      }
    } else {
      log('User denied notification permissions.');
    }

    // Listen for messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Message received: ${message.notification?.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message opened: ${message.notification?.title}');
    });
  }
}
