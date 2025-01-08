import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showCustomDialog(
  BuildContext context, {
  required String title,
  required VoidCallback onConfirm,
  required String buttonText,
}) {
  showAdaptiveDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (context) => Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: Container(
            height: 180.h,
            width: 300.w,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorConsatnts.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: applyBoldStyle(
                    fontSize: 16,
                    fontColor: ColorConsatnts.black,
                  ),
                ),
                const VerticalSpacer(space: 14),
                Text(
                  "Are you sure you want to $title ?",
                  style: applyMediumStyle(
                    fontSize: 18,
                    fontColor: ColorConsatnts.black,
                  ),
                ),
                const VerticalSpacer(space: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                        text: "Yes",
                        color: ColorConsatnts.red.withOpacity(0.7),
                        width: 100,
                        onTap: onConfirm),
                    const HorizontalSpacer(space: 20),
                    AppButton(
                      text: "No",
                      width: 100,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
