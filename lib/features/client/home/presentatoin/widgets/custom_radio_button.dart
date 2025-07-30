import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String value;
  final String text;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: Row(
        children: [
          Transform.scale(
            scale: 0.9,
            child: Radio<String>.adaptive(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: ColorConsatnts.primary,
            ),
          ),
          const HorizontalSpacer(space: 4),
          Text(
            text,
            style: applyMediumStyle(
              fontSize: 14,
              fontColor: ColorConsatnts.black,
            ),
          ),
        ],
      ),
    );
  }
}
