import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles/text_styles.dart';

class RoleContainer extends StatelessWidget {
  const RoleContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.discription,
    required this.onTap, 
    required this.titleAr,
  });
  final String imagePath;
  final String title;
  final String discription;
  final VoidCallback onTap; 
  final String titleAr;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: ColorConsatnts.grey.withOpacity(0.1),
          border: Border.all(color: ColorConsatnts.black),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(top: 4.h),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style:
                  applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
            ),
            const SizedBox(height: 10), 
            Text(
              titleAr,
              style:
                  applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                discription,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: applySemiBoldStyle(
                    fontSize: 12, fontColor: ColorConsatnts.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
