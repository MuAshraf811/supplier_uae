import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showTermsAndConditionsDialog(BuildContext context, bool isSeller) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) => Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorConsatnts.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: ListView(
          children: [
            Text(
              "By Signing In , You agree to Our Terms & Conditions Which is : ",
              style: applyBoldStyle(
                fontSize: 16,
                fontColor: ColorConsatnts.primary,
              ),
            ),
            const VerticalSpacer(space: 12),
            Text(
              isSeller
                  ? AppConst.sellerTermsAndConditions
                  : AppConst.termsAndConditions,
              style: applySemiBoldStyle(
                fontSize: 16,
                fontColor: ColorConsatnts.black,
              ),
            ),
            const VerticalSpacer(space: 16),
            AppButton(
                text: "Agree",
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context,
                      isSeller
                          ? RouteConstants.supplierHomeView
                          : RouteConstants.logInView);
                })
          ],
        ),
      ),
    ),
  );
}
