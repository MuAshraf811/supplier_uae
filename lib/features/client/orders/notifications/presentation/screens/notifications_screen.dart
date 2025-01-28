import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_cubit.dart';
import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_states.dart';

import '../../../../../../core/utils/service_locator.dart';
import '../../../../../../core/utils/widgets/terms_and_conditions_dialog.dart';
import '../../../../chat/presentation/cubit/chat_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
            final notifications = NotificationsCubit.allNotifications;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacer(space: 16),
                  Text(
                    " Notifications",
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
                        notificationDate: NotificationsCubit.allNotifications[index].date.toString(),
                        notificationBody: notifications[index].body,
                        offerSupplierId: notifications[index].offerSupplierId,
                      ),
                    ),
                  ) : const Center(child: Text('No Notifications Yet!'),),
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
  });
  final String notificationTitle;
  final String notificationBody;
  final String notificationDate;
  final String? offerSupplierId;
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
              maxLines: 4,
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
                  showTermsAndConditionsDialog(context, false,offerSupplierId: offerSupplierId);
                }, child: const Text('Accept')
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

[
{"title":"Congratulation! accepted Offer","body":"Your offer has been accepted successfully","data":{"date":"2025-1-17 at: 15:37","offerSupplierId":""}},
{"title":"Congratulation! accepted Offer","body":"Your offer has been accepted successfully","data":{"date":"2025-1-17 at: 16:18","offerSupplierId":""}},
{"title":"Congratulation! accepted Offer","body":"Your offer has been accepted successfully","data":{"date":"2025-1-25 at: 18:51","offerSupplierId":""}}
]
 
 
  */