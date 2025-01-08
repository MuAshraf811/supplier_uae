import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/spacers.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
  });
  final bool isSender;
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        margin: EdgeInsets.only(right: 12.w, bottom: 8.h, left: 12.w),
        width: MediaQuery.sizeOf(context).width / 1.6,
        decoration: BoxDecoration(
          color: isSender ? ColorConsatnts.primary : ColorConsatnts.white,
          border: Border.all(
              color:
                  isSender ? ColorConsatnts.primary : ColorConsatnts.primary),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isSender ? 16.r : 0),
            bottomRight: Radius.circular(isSender ? 0 : 16.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              maxLines: 15,
              style: applySemiBoldStyle(
                fontSize: 16,
                fontColor:
                    isSender ? ColorConsatnts.white : ColorConsatnts.black,
              ),
            ),
            const VerticalSpacer(space: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: applyRegularStyle(
                  fontSize: 13,
                  fontColor:
                      isSender ? ColorConsatnts.white : ColorConsatnts.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
