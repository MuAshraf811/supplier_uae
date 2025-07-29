import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/app_text_field.dart';
import 'package:supplier_app/core/utils/widgets/custom_app_bar.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/service_locator.dart';

class ForgetPasswordClientView extends StatelessWidget {
  ForgetPasswordClientView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const VerticalSpacer(space: 32),
                const GeneralAppBar(title: "Reset Password Screen", isBackArrowShown: true,),
                const VerticalSpacer(space: 24),
                 AppTextField(
                  label: "Enter Your Email",
                  suffixIcon: Icons.email,  
                  controller: ServiceLocator.getIt<AuthenticationCubit>().emailResetController,
                  validator: (val) {
                    if(val == null || val.isEmpty){ 
                      return "Enter Your Email";
                    }return null ;
                  },
                ),
                const VerticalSpacer(space: 32),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  buildWhen: (previous, current) =>
                      current is SendingPasswordResetEmailErrorState ||
                      current is SendingPasswordResetEmailSuccessState ||
                      current is SendingPasswordResetEmailState,
                  listenWhen: (previous, current) =>
                      current is SendingPasswordResetEmailErrorState ||
                      current is SendingPasswordResetEmailSuccessState ||
                      current is SendingPasswordResetEmailState,
                  listener: (context, state) { 
                    if(state is SendingPasswordResetEmailSuccessState){ 
                      showCustomSnackBar(context, "Check Your Email,Password Reset Email Sent!!", ColorConsatnts.primary); 
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is SendingPasswordResetEmailState) {
                      return const LoadingButton();
                    }
                    return AppButton(
                      text: "Send",
                      onTap: () {
                        if (formKey
                            .currentState!
                            .validate()) {
                          ServiceLocator.getIt<AuthenticationCubit>().forgetPassword();
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36.h,
      decoration: BoxDecoration(
        color: ColorConsatnts.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Transform.scale(
          scale: 0.8,
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: ColorConsatnts.white,
          ),
        ),
      ),
    );
  }
}
