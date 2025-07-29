import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/client/orders/presentation/widget/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierOrderItem extends StatelessWidget {
  const SupplierOrderItem({
    super.key,
    required this.index,
    required this.orderName,
    required this.orderDetails,
    required this.orderDescription,
    required this.orderDate,
    required this.onTap,
    required this.clientId, 
    required this.category, 
    required this.orderId
  });
  final int index;
  final String orderName;
  final String orderDetails;
  final String orderDescription;
  final String orderDate;
  final VoidCallback onTap;
  final String clientId; 
  final String category; 
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Text(
              "Client : ",
              style: applyBoldStyle(
                  fontSize: 12, fontColor: ColorConsatnts.primary),
            ),
              const SvgHandler(
                imagePath: AssetsConstants.anonymousPerson,
                color: ColorConsatnts.grey,
                height: 24,
                width: 24,
              ),

            const HorizontalSpacer(space: 2),
            Text(
              clientId,
              style: applyMediumStyle(
                  fontSize: 13, fontColor: ColorConsatnts.lightBlack).copyWith(
                overflow: TextOverflow.ellipsis
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 16.h),
          margin: EdgeInsets.only(bottom: 16.h, top: 4.h),
          decoration: BoxDecoration(
              border: Border.all(color: ColorConsatnts.grey),
              borderRadius: BorderRadius.circular(10.r)),
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
                        BorderRadius.only(topLeft: Radius.circular(10.r))),
                child: Text(
                  index.toString(),
                   maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: applyBoldStyle(
                    fontSize: 14,
                    fontColor: ColorConsatnts.white,
                  ),
                ),
              ),
                Padding(
                padding: EdgeInsets.only(left: 4.w, top: 6.h),
                child: Text(
                  "Order Id : $orderId",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: applyBoldStyle(
                    fontSize: 14,
                    fontColor: ColorConsatnts.black,
                  ),
                ),
              ),
              const VerticalSpacer(space: 4),
                Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  "Category : $category",
                   maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: applyBoldStyle(
                    fontSize: 14,
                    fontColor: ColorConsatnts.red,
                  ),
                ),
              ),
              const VerticalSpacer(space: 2),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  "Type : $orderName",
                   maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: applyBoldStyle(
                    fontSize: 14,
                    fontColor: ColorConsatnts.red,
                  ),
                ),
              ),
              const VerticalSpacer(space: 8),
              const DividerWithText(text: "Order Details"),
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
              const DividerWithText(text: "Order Description"),
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
              const VerticalSpacer(space: 24),
              Padding(
                padding: EdgeInsets.only(left: 12.0.w, right: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      text: "Make Offer",
                      textColor: ColorConsatnts.white,
                      color: ColorConsatnts.primary,
                      fontSize: 16,
                      width: 160.w,
                      onTap: onTap,
                    ),
                    Text(
                      orderDate,
                      style: applyMediumStyle(
                        fontSize: 14,
                        fontColor: ColorConsatnts.lightBlack,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
