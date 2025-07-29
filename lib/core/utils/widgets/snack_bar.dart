import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showCustomSnackBar(BuildContext context, String text, Color backgroundColor,
    {int duration = 3}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      showCloseIcon: true,
      closeIconColor: ColorConsatnts.white,
      duration: Duration(seconds: duration),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: ColorConsatnts.white, width: 2.h),
      ),
      content: Text(
        text,
        style: applyMediumStyle(
          fontSize: 15,
          fontColor: ColorConsatnts.white,
        ),
      ),
    ),
  );
}
