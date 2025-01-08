import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar({
    super.key,
    required this.title, required this.isBackArrowShown,
  });
  final String title; 
  final bool isBackArrowShown;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      isBackArrowShown?  InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: const SvgHandler(
              imagePath: AssetsConstants.arrowLeftIcon,
              height: 20,
              width: 20,
            ),
          ),
        ): const SizedBox.shrink(),
        const Spacer(),
        Text(
          title,
          style: applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
        ),
        const Spacer(),
      ],
    );
  }
}
