import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/app_text_field.dart';
import 'package:supplier/core/utils/widgets/custom_app_bar.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../client/Authentication/presentation/widgets/password_validation_coulmn.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(space: 32),
              const GeneralAppBar(title: "Reset Password View", isBackArrowShown: true,),
              const VerticalSpacer(space: 24),
              const AppTextField(
                  label: "Enter password",
                  suffixIcon: Icons.remove_red_eye_rounded),
              const VerticalSpacer(space: 12),
              PasswordValidationPart(
                ctx: context,
              ),
              const VerticalSpacer(space: 12),
              const AppTextField(
                  label: "Confirm password",
                  suffixIcon: Icons.remove_red_eye_rounded),
              const VerticalSpacer(space: 24),
              AppButton(
                text: "Submit",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
