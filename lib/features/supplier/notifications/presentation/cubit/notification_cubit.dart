
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
  static NotificationsCubit get(context) =>  BlocProvider.of(context);

  static List<NotificationModel> allNotifications = [];



  addNotification(NotificationModel content) async {
    emit(FetchingNotificationState());
    /// TODO load past notifications
    // print('added to cubit list::: current isSupplier? ${AppConfigCubit.isSupplier}');
    // Cache the updated list
    // await _cacheNotifications();
    // print('cached to storage');
    // await saveNotificationsToFirestore();
    // print('saved to firestore');
    
    allNotifications.add(content);

    // Convert to JSON for Firestore
    final List<Map<String, dynamic>> notificationsJson =
    allNotifications.map((notification) => notification.toJson()).toList();

    String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';


    final instance =
    FirebaseFirestore.instance.collection(collectionName);

    // Store in Firestore
    await instance
        .doc( AppConfigCubit.currentUserDataId)
        .update({
      'notificationHistory': jsonEncode(notificationsJson)
    });
    emit(FetchingNotificationSuccessState());

  }
  // Future<void> saveNotificationsToFirestore() async {
  //   try {
  //     // Convert notifications to JSON
  //     final List<Map<String, dynamic>> notificationsJson =
  //     allNotifications.map((notification) => notification.toJson()).toList();

  //     // Convert to string for storage
  //     final String notificationsString = jsonEncode(notificationsJson);

  //   // Update user document in Firestore
  //   //await /* your Firestore update logic */

  //   emit(FetchingNotificationSuccessState());
  //   } catch (e) {
  //   emit(FetchingNotificationErrorState(e.toString()));
  //   }
  // }
  // Future<void> _cacheNotifications() async {
  //   try {
  //     // Convert notifications list to JSON
  //     final List<Map<String, dynamic>> notificationsJson =
  //     allNotifications.map(
  //             (notification) => notification.toJson()).toList();

  //     // Store JSON string in SharedPreferences
  //     await SharedPreferencesManager.storeStringValue(
  //       key: StorageConstants.msgHistory,
  //       value: jsonEncode(notificationsJson),
  //     );

  //     String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';

  //     final instance =
  //     FirebaseFirestore.instance.collection(collectionName);

  //     final  res = await instance
  //         .where("uuid",isEqualTo: AppConfigCubit.currentUserId).get();

  //     final notificationHistory = SharedPreferencesManager.getStringValue(key: StorageConstants.msgHistory);
  //     instance.doc(res.docs.first.id).update(
  //       {
  //         "notificationHistory": notificationHistory,
  //       },
  //     );



  //   } catch (e) {
  //     emit(FetchingNotificationErrorState('Failed to cache notifications: ${e.toString()}'));
  //   }
  // }

  Future<void> loadNotifications() async {
    try {
      // NotificationsCubit().clearNotifications();
      emit(FetchingNotificationState());
      // SharedPreferencesManager.storeStringValue(key: StorageConstants.msgHistory, value: "");

      // Get cached notifications JSON string
      final String? cachedNotifications =
      SharedPreferencesManager.getStringValue(key: StorageConstants.msgHistory);

      if (cachedNotifications != null && cachedNotifications.isNotEmpty) {

        // print('found cached notifications');

        // Parse JSON string to List of Maps
        final List<dynamic> notificationsJson = jsonDecode(cachedNotifications);
        // print(notificationsJson.toString());
        // Convert each Map to NotificationModel
        allNotifications = notificationsJson
            .map((json) => NotificationModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      else if(cachedNotifications != null && cachedNotifications.isEmpty){
        print('fetching remote notifications::: isSupplier? ${AppConfigCubit.isSupplier}');
        String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';

        final instance =
        FirebaseFirestore.instance.collection(collectionName);

        final  res = await instance
            .where("uuid",isEqualTo: AppConfigCubit.currentUserId).get();
        // print('uuid:::${AppConfigCubit.currentUserId}');
        // print('res:::${res.size}');
        if(res.docs.isNotEmpty) {
          // print('fetching user notifications');
          String currentUserNotifications = UserDataModel.fromJson(res.docs.first.data()).notificationHistory;
          if(currentUserNotifications.isNotEmpty){
            final dynamic jsonData = jsonDecode(currentUserNotifications);
            // print(jsonData.toString());
            // Handle single notification case
            if (jsonData is Map<String, dynamic>) {
              // If it's a single notification
              allNotifications = [NotificationModel.fromJson(jsonData)];
            } else if (jsonData is List) {
              // If it's a list of notifications
              allNotifications = jsonData
                  .map((item) => NotificationModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            }
          }else{
            allNotifications = [];
            emit(EmptyNotificationsState());
      return;
          }
        } else {
          print('no user found');
          emit(FetchingNotificationErrorState('No Notification found'));
      return;
        }

      }

      emit(FetchingNotificationSuccessState());
      return;
    } catch (e) {
      emit(FetchingNotificationErrorState('Failed to load notifications: ${e.toString()}'));
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
      emit(FetchingNotificationErrorState('Failed to clear notifications: ${e.toString()}'));
    }
  }

  // TODO will have a list of notifi model and proccess it below
  addToNotificationHistory(NotificationModel notification, targetDataId, bool isSupplier) async {
    
    String collectionName = isSupplier ? 'Suppliers' : 'Users';
    final instance = FirebaseFirestore.instance.collection(collectionName);

    // get past history
    final  targetDetails = await instance.doc(targetDataId).get();

    // convert history into a list
    if(targetDetails.data()!=null) {
      String currentUserNotifications = UserDataModel.fromJson(targetDetails.data()!).notificationHistory;
      if(currentUserNotifications.isNotEmpty){
        final dynamic jsonData = jsonDecode(currentUserNotifications);
        // print(jsonData.toString());
        // Handle single notification case
        if (jsonData is Map<String, dynamic>) {
          // If it's a single notification
          allNotifications = [NotificationModel.fromJson(jsonData)];
        } else if (jsonData is List) {
          // If it's a list of notifications
          allNotifications = jsonData
              .map((item) => NotificationModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
      }else{
        allNotifications = [];
      }
    } 

    // add new notification to the list
    allNotifications.add(notification);

    // convert list back to json encodded string
    final List<Map<String, dynamic>> notificationsJson =
    allNotifications.map((notification) => notification.toJson()).toList();

    // update the notificationHistory in the firestore for the required user or supplier
    await instance
        .doc(targetDataId)
        .update({
      'notificationHistory': jsonEncode(notificationsJson)
    });
  }

}
