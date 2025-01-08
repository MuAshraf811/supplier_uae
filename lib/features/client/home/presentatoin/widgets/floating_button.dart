import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      },
      mini: true,
      backgroundColor: ColorConsatnts.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child:Image.asset("assets/images/logo2.jpeg", width: 32.w, fit: BoxFit.fill,)
    );
  }
}
