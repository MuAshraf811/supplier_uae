import 'package:flutter/cupertino.dart';

@immutable
sealed class NotificationStates {}

final class NotificationInitial extends NotificationStates {}
final class FetchingNotificationState extends NotificationStates{}
final class FetchingNotificationSuccessState extends NotificationStates{}
final class EmptyNotificationsState extends NotificationStates{}
class FetchingNotificationErrorState extends NotificationStates {
  final String error;
  FetchingNotificationErrorState(this.error);
}