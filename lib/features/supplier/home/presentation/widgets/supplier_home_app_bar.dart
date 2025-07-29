// import 'package:supplier_app/core/utils/constants/assets_constants.dart';
// import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
// import 'package:supplier_app/core/utils/constants/route_constants.dart';
// import 'package:supplier_app/core/utils/widgets/spacers.dart';
// import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
// import 'package:supplier_app/features/client/home/presentatoin/widgets/search_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class SupplierHomePageAppBar extends StatelessWidget {
//   const SupplierHomePageAppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Expanded(
//           child: CustomTextField(),
//         ),
//         const HorizontalSpacer(space: 12),
//         InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, RouteConstants.supplierFilterView);
//           },
//           child: Container(
//             width: 36.w,
//             height: 36.w,
//             decoration: BoxDecoration(
//               color: ColorConsatnts.primary.withOpacity(0.2),
//               shape: BoxShape.circle,
//             ),
//             child: Transform.scale(
//               scale: 0.65,
//               child: const SvgHandler(
//                 imagePath: AssetsConstants.filterIcon,
//                 height: 15,
//                 width: 15,
//                 color: ColorConsatnts.primary,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
