import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.fontSize,
    this.color,
    this.raduis,
    this.textColor,
  });
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? fontSize;
  final Color? color;

  final Color? textColor;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        alignment: Alignment.center,
        height: 38.h,
        decoration: BoxDecoration(
          color: color ?? ColorConsatnts.primary,
          border: Border.all(color: ColorConsatnts.white),
          borderRadius: BorderRadius.circular(raduis ?? 12.r),
        ),
        child: Text(
          text,
          style: applySemiBoldStyle(
            fontSize: fontSize ?? 16,
            fontColor: textColor ?? ColorConsatnts.white,
          ),
        ),
      ),
    );
  }
}
