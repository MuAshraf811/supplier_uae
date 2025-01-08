import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/spacers.dart';

class ShimmerOrderItem extends StatelessWidget {
  const ShimmerOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 16.h),
        margin: EdgeInsets.only(bottom: 18.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 24.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 16.h,
                width: 100.w,
                color: Colors.grey[400],
                margin: EdgeInsets.symmetric(vertical: 8.h),
              ),
            ),
            const VerticalSpacer(space: 8),
            Container(
              height: 12.h,
              width: 140.w,
              color: Colors.grey[400],
              margin: EdgeInsets.symmetric(vertical: 8.h),
            ),
            const VerticalSpacer(space: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 14.h,
                width: double.infinity,
                color: Colors.grey[400],
              ),
            ),
            const VerticalSpacer(space: 8),
            Container(
              height: 12.h,
              width: 140.w,
              color: Colors.grey[400],
              margin: EdgeInsets.symmetric(vertical: 8.h),
            ),
            const VerticalSpacer(space: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 14.h,
                width: double.infinity,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.w, top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    color: Colors.grey[400],
                  ),
                 const HorizontalSpacer(space: 20),
                  Container(
                    height: 24.h,
                    width: 24.w,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
