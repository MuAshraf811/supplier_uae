import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/orders/presentation/widget/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.index,
    required this.orderName,
    required this.orderDetails,
    required this.orderDescription, 
    required this.onDelete,
  });
  final int index;
  final String orderName;
  final String orderDetails;
  final String orderDescription; 
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 16.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConsatnts.grey),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 24.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: ColorConsatnts.primary,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(12.r))),
            child: Text(
              index.toString(),
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              orderName,
              style: applyBoldStyle(
                fontSize: 16,
                fontColor: ColorConsatnts.primary,
              ),
            ),
          ),
          const VerticalSpacer(space: 8),
          DividerWithText(text: S.of(context).order_details),
          const VerticalSpacer(space: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              orderDetails,
              textAlign: TextAlign.center,
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
          ),
          const VerticalSpacer(space: 8),
          DividerWithText(text: S.of(context).order_summary),
          const VerticalSpacer(space: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              orderDescription,
              textAlign: TextAlign.center,
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
          ),
          Align( 
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 24.w, top: 16.h),
              child:    InkWell( 
                    onTap: onDelete,
                    child: const SvgHandler(
                      imagePath: AssetsConstants.deleteIcon,
                      height: 24,
                      width: 24,
                      color: Colors.red,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

