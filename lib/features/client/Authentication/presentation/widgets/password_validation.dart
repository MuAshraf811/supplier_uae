import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidationItem extends StatelessWidget {
  const PasswordValidationItem(
      {super.key, required this.validationText, required this.isActive});
  final String validationText;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3.w,
          backgroundColor:
              isActive ? ColorConsatnts.primary : ColorConsatnts.grey,
        ),
        const HorizontalSpacer(space: 8),
        Text(
          validationText,
          style: applySemiBoldStyle(
                  fontSize: 14,
                  fontColor: isActive
                      ? ColorConsatnts.primary
                      : ColorConsatnts.lightBlack)
              .copyWith(
            decoration:
                isActive ? TextDecoration.none : TextDecoration.lineThrough,
          ),
        )
      ],
    );
  }
}
