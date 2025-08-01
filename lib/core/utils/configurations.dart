import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/features/supplier/notifications/data/models/notifications_model.dart';
import 'package:supplier_app/features/supplier/notifications/presentation/cubit/notification_cubit.dart';

import '../cubit/app_config_cubit.dart';

class NotificationsManager {
  NotificationsManager._();
  static final NotificationsManager _instance = NotificationsManager._();
  factory NotificationsManager() => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final NotificationsCubit _notificationsCubit = NotificationsCubit();

  Future<void> initialize() async {

    print('initializing notifications');

    final settings = await _requestPermissions();
    print("requesting permission");
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _setupTokens();
    //  await _setupMessageHandlers();
    }
  }

  Future<NotificationSettings> _requestPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    return settings;
  }

  Future<void> _setupTokens() async {
    // Handle APNS token for iOS
    final apnsToken = await _firebaseMessaging.getAPNSToken();
    if (apnsToken != null && apnsToken.isNotEmpty) {
      // await _storeFCMToken(apnsToken);
    }
    // Handle FCM token
    final fcmToken = await _firebaseMessaging.getToken();
    if (fcmToken != null && fcmToken.isNotEmpty) {
      await _storeFCMToken(fcmToken);
    }
    // Listen for token refresh
    _firebaseMessaging.onTokenRefresh.listen(_storeFCMToken);
  }
  Future<void> _storeFCMToken(String token) async {
    if(token.isNotEmpty) {
      await SharedPreferencesManager.storeStringValue(
      key: StorageConstants.fcmToken,
      value: token,
    );

    if(AppConfigCubit.isLogged) {
      
      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';

      final instance =
      FirebaseFirestore.instance.collection(collectionName);
      instance.doc(AppConfigCubit.currentUserDataId).update(
        {
          "fcmToken": token,
        },
      );
    }
    }
  }

  Future<void> setupMessageHandlers() async {
    // Foreground messages
    FirebaseMessaging.onMessage.listen(handleMessage);

    // When app is opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void handleMessage(RemoteMessage message) {
    if (message.notification != null) {
      // final notification = NotificationModel(
      //   id: '0',
      //   title: message.notification?.title ?? "NO TITLE",
      //   body: message.notification?.body ?? "NO BODY",
      //   date: DateTime.tryParse(message.data['date']),
      //   offerSupplierId: message.data['offerSupplierId'],
      //   offerId: message.data['offerId'],
      //   orderId: message.data['orderId'],
      // );
    }
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> clearNotifications() async {
    await _notificationsCubit.clearNotifications();
  }
}

// Top-level background handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // final notification = NotificationModel(
  //       id: '0',
  //       title: message.notification?.title ?? "NO TITLE",
  //       body: message.notification?.body ?? "NO BODY",
  //       date: message.data['date'],
  //       offerSupplierId: message.data['offerSupplierId'],
  //       offerId: message.data['offerId'],
  //       orderId: message.data['orderId'],
  //     );
}

