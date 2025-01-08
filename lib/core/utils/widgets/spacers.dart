import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({super.key, required this.space});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space.h,
    );
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({super.key, required this.space});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space.w,
    );
  }
}
