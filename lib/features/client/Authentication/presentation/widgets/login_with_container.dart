import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';

class LogInWithContainer extends StatelessWidget {
  const LogInWithContainer({
    super.key,
    required this.label,
    required this.imagePath,
    this.color,
  });
  final String label;
  final String imagePath;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      height: 42.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorConsatnts.white,
        border: Border.all(color: ColorConsatnts.lightBlack),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style:
                applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
          ),
          const HorizontalSpacer(space: 12),
          SvgHandler(
            imagePath: imagePath,
            height: 20,
            width: 16,
            color: color,
          )
        ],
      ),
    );
  }
}
