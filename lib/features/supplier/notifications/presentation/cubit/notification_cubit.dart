import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_states.dart';

import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../client/Authentication/model/user_data_model.dart';
import '../../data/models/notifications_model.dart';

class NotificationsCubit extends Cubit<NotificationStates> {
  NotificationsCubit() : super(NotificationInitial()) {
    loadNotifications(); // Load cached notifications when Cubit is created
  }
  static NotificationsCubit get(context) => BlocProvider.of(context);

  static List<NotificationModel> allNotifications = [];

  Future<void> loadNotifications() async {
    try {
      // NotificationsCubit().clearNotifications();
      emit(FetchingNotificationState());

        String collectionName =
            AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
        final instance = FirebaseFirestore.instance.collection(collectionName);

        final res = await instance
            .where("uuid", isEqualTo: AppConfigCubit.currentUserId)
            .get();
        if (res.docs.isNotEmpty) {
          String currentUserNotifications =
              UserDataModel.fromJson(res.docs.first.data()).notificationHistory;

          if (currentUserNotifications.isNotEmpty) {
            final dynamic jsonData = jsonDecode(currentUserNotifications);
            // print(jsonData.toString());
            // Handle single notification case
            if (jsonData is Map<String, dynamic>) {
              // If it's a single notification
              allNotifications = [NotificationModel.fromJson(jsonData)];
            } else if (jsonData is List) {
              // If it's a list of notifications
              allNotifications = jsonData
                  .map((item) =>
                      NotificationModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            }
          } else {
            allNotifications = [];
            emit(EmptyNotificationsState());
            return;
          }
        } else {
          emit(FetchingNotificationErrorState('No Notification found'));
          return;
        }
      emit(FetchingNotificationSuccessState());
      return;
    } catch (e) {
      emit(FetchingNotificationErrorState(
          'Failed to load notifications: ${e.toString()}'));
      rethrow;
    }
  }

  Future<void> clearNotifications() async {
    try {
      emit(FetchingNotificationState());

      // Clear in-memory list
      allNotifications.clear();

      // Clear cached notifications
      await SharedPreferencesManager.storeStringValue(
        key: StorageConstants.msgHistory,
        value: '',
      );

      emit(FetchingNotificationSuccessState());
    } catch (e) {
      emit(FetchingNotificationErrorState(
          'Failed to clear notifications: ${e.toString()}'));
    }
  }

}
