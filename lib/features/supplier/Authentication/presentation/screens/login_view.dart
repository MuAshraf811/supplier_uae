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
import '../../../../../core/utils/constants/storage_const.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/widgets/app_button.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../client/Authentication/presentation/widgets/login_with_container.dart';
import '../../../../client/Authentication/presentation/widgets/or_divider.dart';
import '../../../../client/Authentication/presentation/widgets/register_question.dart';

class SupplierLoginView extends StatelessWidget {
  SupplierLoginView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    
      backgroundColor: ColorConsatnts.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Form(
          key: formKey,
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
                "Hello! Let's log you in.",
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
                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = true;
                    AppConfigCubit.currentUserDataId = SharedPreferencesManager
                        .getStringValue(
                        key: StorageConstants.userDataIdKey
                    );
                    AppConfigCubit.currentUserId = SharedPreferencesManager
                        .getStringValue(
                        key: StorageConstants.userId
                    );

                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: true);

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
                      if (formKey
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

              BlocConsumer<SupplierAuthCubit, SupplierAuthState>(
                listenWhen: (previous, current) =>
                current is SuccessLogInWithGoogleState ||
                    current is ErrorLogInWithGoogleState ||
                    current is LoadingLogInWithGoogleState || current is NewUserState,
                buildWhen: (previous, current) =>
                current is SuccessLogInWithGoogleState ||
                    current is LoadingLogInWithGoogleState ||
                    current is ErrorLogInWithGoogleState,
                listener: (context, state) {
                  if (state is ErrorLogInWithGoogleState) {
                    showCustomSnackBar(context, state.error, Colors.red,
                        duration: 8);
                  }
                  if (state is SuccessLogInWithGoogleState) {
                    showCustomSnackBar(
                        context, 'Welcome', ColorConsatnts.primary,
                        duration: 8);
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.supplierHomeView);
                  }else  if (state is NewUserState) {
                    showCustomSnackBar(
                        context, 'Welcome', ColorConsatnts.primary,
                        duration: 8);
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.suppCompleteLoginView);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingLogInWithGoogleState) {
                    return Container(
                      width: double.infinity,
                      height: 38.h,
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                          color: ColorConsatnts.white,
                          border: Border.all(color: ColorConsatnts.primary),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Transform.scale(
                          scale: 0.7,
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConsatnts.primary,
                            valueColor: AlwaysStoppedAnimation(
                                ColorConsatnts.primary.withOpacity(0.85)),
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      ServiceLocator.getIt<SupplierAuthCubit>().registerWithGoogle();
                    },
                    child: const LogInWithContainer(
                      label: "LogIn With Gmail",
                      color: Colors.red,
                      imagePath: AssetsConstants.gmailIcon,
                    ),
                  );
                },
              ),
              BlocConsumer<SupplierAuthCubit, SupplierAuthState>(
                listenWhen: (previous, current) =>
                current is SuccessLogInWithAppleState ||
                    current is ErrorLogInWithAppleState ||
                    current is LoadingLogInWithAppleState|| current is NewUserStata,
                buildWhen: (previous, current) =>
                current is SuccessLogInWithAppleState ||
                    current is ErrorLogInWithAppleState ||
                    current is LoadingLogInWithAppleState,
                listener: (context, state) {
                  if (state is ErrorLogInWithAppleState) {
                    showCustomSnackBar(context, state.error, Colors.red,
                        duration: 8);
                  }
                  if (state is SuccessLogInWithAppleState) {

                    Navigator.pushReplacementNamed(
                        context, RouteConstants.supplierHomeView);
                  }else  if (state is NewUserStata) {
                    showCustomSnackBar(
                        context, 'Welcome', ColorConsatnts.primary,
                        duration: 8);
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.suppCompleteLoginView);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingLogInWithAppleState) {
                    return Container(
                      width: double.infinity,
                      height: 38.h,
                      decoration: BoxDecoration(
                          color: ColorConsatnts.white,
                          border: Border.all(color: ColorConsatnts.primary),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Transform.scale(
                          scale: 0.9,
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConsatnts.primary,
                            valueColor: AlwaysStoppedAnimation(
                                ColorConsatnts.white.withOpacity(0.85)),
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      ServiceLocator.getIt<SupplierAuthCubit>().logInWithApple();
                    },
                    child: const LogInWithContainer(
                      label: "LogIn With Apple",
                      imagePath: AssetsConstants.iosIcon,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
