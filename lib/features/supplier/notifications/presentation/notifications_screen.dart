import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier/features/supplier/notifications/data/models/notifications_model.dart';
import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_cubit.dart';
import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_states.dart';

import '../../../../core/utils/notification_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/widgets/terms_and_conditions_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../client/chat/presentation/cubit/chat_cubit.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String recipient = 'admin';
  late NotificationService _notificationService;
  List<NotificationModel> _notifications = [];
  int _previousCount = 0;

  @override
  void initState() {
    super.initState();
    _listenToNotifications();
  }


  void _listenToNotifications() {
    ServiceLocator.getIt<NotificationService>().getUserNotificationsStream().listen((notifications) {
      // Check for new notifications
      if (_previousCount > 0 && notifications.length > _previousCount) {
        // Get the newest notification
        final newNotification = notifications.first;
        // _showLocalNotification(newNotification);
      }

      setState(() {
        _previousCount = notifications.length;
        _notifications = notifications;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => ServiceLocator.getIt<ChatCubit>()),
        BlocProvider(create: (context) => NotificationsCubit(),)
      ],
      child: BlocConsumer<NotificationsCubit,NotificationStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is FetchingNotificationState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchingNotificationSuccessState) {
            final List<NotificationModel> notifications = NotificationsCubit.allNotifications.reversed.toList();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacer(space: 16),
                  Text(
                    S.of(context).notifications,
                    style:
                    applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
                  ),
                  const VerticalSpacer(space: 20),
                  NotificationsCubit.allNotifications.isNotEmpty?
                    Expanded(
                    child: ListView.builder(
                      itemCount: NotificationsCubit.allNotifications.length,
                      itemBuilder: (context, index) => NotificationItem(
                        notificationTitle: notifications[index].title,
                        notificationDate: notifications[index].date.toString(),
                        notificationBody: notifications[index].body,
                        offerSupplierId: notifications[index].offerSupplierId,
                        offerId: notifications[index].offerId,
                        orderId: notifications[index].orderId,
                      ),
                    ),
                  ) : Center(child: Text(S.of(context).no_notifications),),
                ],
              ),
            );
          } else if (state is FetchingNotificationErrorState) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationTitle,
    required this.notificationBody,
    required this.notificationDate,
    this.offerSupplierId,
    this.offerId,
    this.orderId,
  });
  final String notificationTitle;
  final String notificationBody;
  final String notificationDate;
  final String? offerSupplierId;
  final String? offerId;
  final String? orderId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConsatnts.grey),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              notificationTitle,
              style: applyBoldStyle(
                  fontSize: 16, fontColor: ColorConsatnts.black,),
            ),
          ),
          const VerticalSpacer(space: 8),
          FittedBox(
            child: Text(
              notificationBody,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: applyMediumStyle(fontSize: 14, fontColor: Colors.grey),
            ),
          ),
          FittedBox(
            child: Text(
              notificationDate,//.split(' ')[0],
              style: applyRegularStyle(
                  fontSize: 14, fontColor: ColorConsatnts.primary),
            ),
          ),
          if(offerSupplierId !=null && offerSupplierId!.isNotEmpty)
          Row(
            children: [
              BlocProvider(
                create:(context) =>  ServiceLocator.getIt<ChatCubit>(),
                child: ElevatedButton(onPressed: () {
                  // context.read<ChatCubit>().messageController.text = ;
                  showTermsAndConditionsDialog(context, false,
                    offerSupplierId: offerSupplierId,
                    offerId: offerId,
                    orderId: orderId,
                  );
                }, child: Text(S.of(context).accept)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
/*

 
 
  */