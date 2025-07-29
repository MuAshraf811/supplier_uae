import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.list_rounded,
              size: 28.h,
            ),
          ),
          const HorizontalSpacer(space: 18),
          const Expanded(
            child: CustomTextField(),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Text(
            S.of(context).search,
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: 1.w,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 38.h,
          maxWidth: 38.w,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.0.w),
          child: const SvgHandler(
            imagePath: AssetsConstants.searchIcon,
            height: 24,
            width: 24,
            color: ColorConsatnts.primary,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
