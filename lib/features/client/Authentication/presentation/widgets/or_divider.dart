import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 128.w,
          height: 0.75.h,
          color: ColorConsatnts.lightBlack,
        ),
        const HorizontalSpacer(space: 8),
        Text(
          'OR',
          style: applySemiBoldStyle(
              fontSize: 12, fontColor: ColorConsatnts.lightBlack),
        ),
        const HorizontalSpacer(space: 8),
        Container(
          width: 128.w,
          height: 0.9.h,
          color: ColorConsatnts.lightBlack,
        ),
      ],
    );
  }
}
