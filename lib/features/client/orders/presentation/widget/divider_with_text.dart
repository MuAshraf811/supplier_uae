import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.h,
          width: 80.w,
          color: ColorConsatnts.grey,
        ),
        const HorizontalSpacer(space: 6),
        Text(
          text,
          style:
              applyRegularStyle(fontSize: 14, fontColor: ColorConsatnts.grey),
        ),
        const HorizontalSpacer(space: 6),
        Container(
          height: 1.h,
          width: 80.w,
          color: ColorConsatnts.grey,
        ),
      ],
    );
  }
}
