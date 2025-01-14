// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:supplier/core/utils/constants/color_consatnts.dart';
// import 'package:supplier/core/utils/styles/text_styles.dart';
// import 'package:supplier/core/utils/widgets/spacers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_cubit.dart';
// import 'package:supplier/features/supplier/notifications/presentation/cubit/notification_states.dart';
//
// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NotificationsCubit(),
//       child: BlocConsumer<NotificationsCubit,NotificationStates>(
//         listener: (context, state) {
//
//         },
//         builder: (context, state) =>  Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const VerticalSpacer(space: 16),
//               Text(
//                 " Notifications",
//                 style:
//                 applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
//               ),
//               const VerticalSpacer(space: 20),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: NotificationsCubit.allNotifications.length,
//                   itemBuilder: (context, index) => NotificationItem(
//                     notificationTitle: NotificationsCubit.allNotifications[index].title,
//                     notificationDate: NotificationsCubit.allNotifications[index].date??"00:00:00",
//                     notificationBody: NotificationsCubit.allNotifications[index].body,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NotificationItem extends StatelessWidget {
//   const NotificationItem({
//     super.key,
//     required this.notificationTitle,
//     required this.notificationBody,
//     required this.notificationDate,
//   });
//   final String notificationTitle;
//   final String notificationBody;
//   final String notificationDate;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300.w,
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//       margin: EdgeInsets.only(bottom: 16.h),
//       decoration: BoxDecoration(
//           border: Border.all(color: ColorConsatnts.grey),
//           borderRadius: BorderRadius.circular(12.r)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 notificationTitle,
//                 style: applyBoldStyle(
//                     fontSize: 16, fontColor: ColorConsatnts.black),
//               ),
//               Text(
//                 notificationDate,
//                 style: applyRegularStyle(
//                     fontSize: 14, fontColor: ColorConsatnts.primary),
//               ),
//             ],
//           ),
//           const VerticalSpacer(space: 8),
//           Text(
//             notificationBody,
//             maxLines: 4,
//             overflow: TextOverflow.ellipsis,
//             style: applyMediumStyle(fontSize: 14, fontColor: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }
