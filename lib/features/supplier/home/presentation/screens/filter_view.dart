// import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
// import 'package:supplier_app/core/utils/styles/text_styles.dart';
// import 'package:supplier_app/core/utils/widgets/app_button.dart';
// import 'package:supplier_app/core/utils/widgets/spacers.dart';
// import 'package:supplier_app/features/client/chat/presentation/widgets/chat_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../client/home/presentatoin/widgets/custom_check.dart';
//
// class FilterView extends StatelessWidget {
//   const FilterView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConsatnts.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const VerticalSpacer(space: 16),
//               const CustomAppbar(title: "Filter Page"),
//               const VerticalSpacer(space: 16),
//               Text(
//                 "Filter Orders Page By :",
//                 style: applySemiBoldStyle(
//                     fontSize: 16, fontColor: ColorConsatnts.primary),
//               ),
//               const VerticalSpacer(space: 20),
//               const CustomCheck(title: "Printing Products"),
//               const VerticalSpacer(space: 8),
//               const CustomCheck(title: "Packaging Products"),
//               const VerticalSpacer(space: 8),
//               const CustomCheck(title: "GiftItems Products"),
//               const VerticalSpacer(space: 8),
//               const CustomCheck(title: "Uniform Products"),
//               const VerticalSpacer(space: 8),
//               const CustomCheck(title: "Signatge Products"),
//               const VerticalSpacer(space: 8),
//               const CustomCheck(title: "Digital Fast Print Products"),
//               const VerticalSpacer(space: 18),
//               AppButton(text: "Filter", onTap: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
