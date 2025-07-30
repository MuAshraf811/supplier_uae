import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/cubit/app_config_cubit.dart';

class NotificationModel {
  final String title;
  final String body;
  final DateTime? date;
  final String? offerSupplierId;
  final String? offerId;
  final String? orderId;
  final String? userId;
  final String? recipientId; // 'all' or specific user ID
  final bool isRead;
  final String id;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.date,
    this.offerSupplierId,
    this.offerId,
    this.orderId,
    this.userId,
    this.recipientId,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String,dynamic> json){
    DateTime timestamp;
    if (json['data']['date'] is Timestamp) {
      timestamp = (json['data']['date'] as Timestamp).toDate();
    } else if (json['data']['date'] is Map) {

      final seconds = json['data']['date']['seconds'] as int;
      final nanoseconds = json['data']['date']['nanoseconds'] as int;
      timestamp = Timestamp(seconds, nanoseconds).toDate();
    } else if(json['data']['date'] is String){
      timestamp = DateTime.parse(json['data']['date']);
    }
    else {

      timestamp = DateTime.now();
      print('Warning: Invalid timestamp format: ${json['data']['date']}');
    }
    return NotificationModel(
      id: json['id']??"",
      title: json['title'],
      body: json['body'],
      date: timestamp,

      offerSupplierId: json['data']!=null?json['data']['offerSupplierId']:null,
      offerId: json['data']!=null?json['data']['offerId']:null,
      orderId: json['data']!=null?json['data']['orderId']:null,
      userId: json['data']!=null?json['data']['userId']:null,
      recipientId: json['recipientId']??"",
      isRead: json['isRead'] ?? false,
    );
  }

  // String get date => this.data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'data': {
        "offerSupplierId":offerSupplierId??"",
        "offerId":offerId??"",
        "orderId":orderId??"",
        "userId":userId??"",
        "isSupplier":AppConfigCubit.isSupplier?"true":"false",
        'date':Timestamp.fromDate(date!) ,
        'recipientId': recipientId,
        'isRead': isRead,
      },
    };
  }
}