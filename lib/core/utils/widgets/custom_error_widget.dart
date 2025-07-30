import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final FlutterErrorDetails errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: ColorConsatnts.red,
                size: 60.w,
              ),
              const VerticalSpacer(space: 12),
              Text(
                "Error occurred",
                style: applyBoldStyle(
                  fontSize: 20,
                  fontColor: ColorConsatnts.red,
                ),
              ),
              const VerticalSpacer(space: 26),
              Text(
                errorMessage.exceptionAsString(),
                textAlign: TextAlign.center,
                style: applyMediumStyle(
                  fontSize: 18,
                  fontColor: ColorConsatnts.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  
  }
}
