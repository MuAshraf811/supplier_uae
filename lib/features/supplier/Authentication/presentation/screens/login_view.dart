import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/snack_bar.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/client/Authentication/presentation/screens/forget_password_view.dart';
import 'package:supplier/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../../core/utils/widgets/app_button.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../client/Authentication/presentation/widgets/login_with_container.dart';
import '../../../../client/Authentication/presentation/widgets/or_divider.dart';
import '../../../../client/Authentication/presentation/widgets/register_question.dart';

class SupplierLoginView extends StatelessWidget {
  const SupplierLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    
      backgroundColor: ColorConsatnts.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Form(
          key: context.read<SupplierAuthCubit>().logInFormKey,
          child: ListView(
           
            children: [
              const VerticalSpacer(space: 28),
              Text(
                "LogIn Page",
                style: applySemiBoldStyle(
                    fontSize: 18, fontColor: ColorConsatnts.black),
              ),
              const VerticalSpacer(space: 24),
              Text(
                "Hello again ! Let's log you in.",
                style: applySemiBoldStyle(
                    fontSize: 18, fontColor: ColorConsatnts.lightBlack),
              ),
              const VerticalSpacer(space: 28),
              AppTextField(
                label: "Example12@email.com",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "This field should not be null";
                  } else if (val.endsWith(".com") == false &&
                      !val.endsWith(".net")) {
                    return "Enter Valid Email";
                  } else if (val.contains("@") == false) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
                suffixIcon: Icons.email,
                controller:
                    context.read<SupplierAuthCubit>().emailLogInController,
              ),
              const VerticalSpacer(space: 14),
              AppTextField(
                label: "Enter Your Password",
                suffixIcon: Icons.remove_red_eye_rounded,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "This field should not be empty";
                  } else if (val.length <= 7) {
                    return "Enter Valid password";
                  }
                  return null;
                },
                controller:
                    context.read<SupplierAuthCubit>().passwordLogInController,
              ),
              const VerticalSpacer(space: 8),
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteConstants.forgetPasswordView);
                    },
                    child: Text(
                      "Forget Password?",
                      style: applySemiBoldStyle(
                          fontSize: 14, fontColor: ColorConsatnts.primary),
                    ),
                  ),
                ),
              ),
              const VerticalSpacer(space: 24),
              BlocConsumer<SupplierAuthCubit, SupplierAuthState>(
                buildWhen: (previous, current) =>
                    current is LogingInErrorState ||
                    current is LogingInState ||
                    current is LogingInSuccessState,
                listenWhen: (previous, current) =>
                    current is LogingInErrorState ||
                    current is LogingInState ||
                    current is LogingInSuccessState,
                listener: (context, state) {
                  if (state is LogingInErrorState) {
                    showCustomSnackBar(
                        context, state.error, ColorConsatnts.red);
                  } else if (state is LogingInSuccessState) {
                    AppConfigCubit.isUserLogged = true;
                    AppConfigCubit.isSupplier=true;
                    SharedPreferencesManager.storeBoolValue(
                        key: AppConst.isUserLogged, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: AppConst.isSupplier, value: true);

                    Navigator.popAndPushNamed(
                        context, RouteConstants.supplierHomeView);
                  }
                },
                builder: (context, state) {
                  if (state is LogingInState) {
                    return const LoadingButton();
                  }
                  return AppButton(
                    text: "LogIn",
                    onTap: () {
                      if (context
                          .read<SupplierAuthCubit>()
                          .logInFormKey
                          .currentState!
                          .validate()) {
                        context.read<SupplierAuthCubit>().logInSupplier();
                      }
                    },
                  );
                },
              ),
              const VerticalSpacer(space: 16),
              const RegisterQuestion(
                isSupplier: true,
              ),
              const VerticalSpacer(space: 32),
              const OrDivider(),
              const VerticalSpacer(space: 24),
              const LogInWithContainer(
                label: "LogIn with Gmail",
                imagePath: AssetsConstants.gmailIcon,
                color: Colors.red,
              ),
              const LogInWithContainer(
                label: "LogIn with apple",
                imagePath: AssetsConstants.iosIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
