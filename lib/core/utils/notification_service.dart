import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';

import '../../features/supplier/notifications/data/models/notifications_model.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId; // Current user's ID

  NotificationService({required this.userId});

  // Collection reference
  CollectionReference get _notificationsRef =>
      _firestore.collection('notifications');

  // Stream for admin dashboard to listen to all notifications
  Stream<List<NotificationModel>> getAllNotificationsStream() {
    return _notificationsRef
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return NotificationModel.fromJson({
          'id':doc.id,
            ...doc.data() as Map<String, dynamic>});
      }).toList();
    });
  }

  // Stream for mobile users to get only their notifications
  Stream<List<NotificationModel>> getUserNotificationsStream() {
    return _notificationsRef
        .where('recipientId', whereIn: [userId, 'all'])
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return NotificationModel.fromJson(
            doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Create a new notification (from admin dashboard)
  Future<void> createNotification({
    required String title,
    required String body,
    required String recipientId,
  }) async {
    final notificationId = _notificationsRef.doc().id;
    final notification = NotificationModel(
      id: notificationId,
      title: title,
      body: body,
      date:DateTime.now(),
      recipientId: recipientId,

      userId: AppConfigCubit.currentUserDataId

    );

    await _notificationsRef.doc(notificationId).set(notification.toJson());
  }

  // Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    await _notificationsRef.doc(notificationId).update({'isRead': true});
  }

  // Delete a notification
  Future<void> deleteNotification(String notificationId) async {
    await _notificationsRef.doc(notificationId).delete();
  }
}
