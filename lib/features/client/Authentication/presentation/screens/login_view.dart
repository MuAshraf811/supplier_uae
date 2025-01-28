import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/app_text_field.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/Authentication/presentation/widgets/login_with_container.dart';
import 'package:supplier/features/client/Authentication/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_const.dart';
import '../../../../../core/utils/constants/storage_const.dart';
import '../../../../../core/utils/storage/shared_preferences.dart';
import '../../../../../core/utils/widgets/snack_bar.dart';
import '../widgets/register_question.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const VerticalSpacer(space: 36),
              Text(
                "LogIn Page.",
                style: applySemiBoldStyle(
                    fontSize: 18, fontColor: ColorConsatnts.black),
              ),
              const VerticalSpacer(space: 22),
              Text(
                "Hello again ! Let's log you in.",
                style: applySemiBoldStyle(
                    fontSize: 18, fontColor: ColorConsatnts.lightBlack),
              ),
              const VerticalSpacer(space: 28),
              AppTextField(
                label: "examole12@email.com",
                type: TextInputType.emailAddress,
                suffixIcon: Icons.email_rounded,
                controller:
                    ServiceLocator.getIt<AuthenticationCubit>().emailLogInController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field Shouldn't be empty";
                  }
                  return null;
                },
              ),
              const VerticalSpacer(space: 8),
              StatefulBuilder(
                builder: (context, changeState) {
                  return AppTextField(
                    label: "Enter Your Password",
                    type: TextInputType.visiblePassword,
                    isSecured: ServiceLocator.getIt<AuthenticationCubit>().isTextSecure,
                    maxLines: 1,
                    minLines: 1,
                    suffixIcon: Icons.remove_red_eye_rounded,
                    suffixSvg: InkWell(
                      onTap: () {
                        changeState(() {
                          ServiceLocator.getIt<AuthenticationCubit>().isTextSecure =
                              !ServiceLocator.getIt<AuthenticationCubit>().isTextSecure;
                        });
                      },
                      child: Icon(
                        !ServiceLocator.getIt<AuthenticationCubit>().isTextSecure
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: ColorConsatnts.primary,
                      ),
                    ),
                    controller: ServiceLocator.getIt<AuthenticationCubit>()
                        .passwordLogInController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Field Shouldn't be empty";
                      }
                      return null;
                    },
                  );
                },
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
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                // listenWhen: (previous, current) =>
                //     current is SuccessLogInWithEmailState ||
                //     current is ErrorLogInWithEmailState ||
                //     current is LoadingLogInWithEmailState,
                // buildWhen: (previous, current) =>
                //     current is SuccessLogInWithEmailState ||
                //     current is ErrorLogInWithEmailState ||
                //     current is LoadingLogInWithEmailState,
                listener: (context, state) {
                  if (state is ErrorLogInWithEmailState) {
                    showCustomSnackBar(
                        context,
                        state.error,
                        Colors.red,
                        duration: 8);
                  }
                  if (state is SuccessLogInWithEmailState) {
                    AppConfigCubit.currentUserDataId = SharedPreferencesManager
                        .getStringValue(
                        key: StorageConstants.userDataIdKey
                    );
                    AppConfigCubit.currentUserId = SharedPreferencesManager
                        .getStringValue(
                        key: StorageConstants.userId
                    );
                    
                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = false;
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: false);

                    Navigator.pushReplacementNamed(
                        context, RouteConstants.homePage);
                  }

                  if (state is SuccessLogInWithEmailState) {
                    showCustomSnackBar(context, "Successful Registration ",
                        ColorConsatnts.primary);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingLogInWithEmailState) {
                    return Container(
                      width: double.infinity,
                      height: 38.h,
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                          color: ColorConsatnts.primary,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Transform.scale(
                          scale: 0.7,
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    );
                  }
                  return AppButton(
                    text: "LogIn",
                    onTap: () {
                      if (formKey
                          .currentState!
                          .validate()) {
                        ServiceLocator.getIt<AuthenticationCubit>().logInWithEmail();
                      }
                    },
                  );
                },
              ),
              const VerticalSpacer(space: 16),
              const RegisterQuestion(
                isSupplier: false,
              ),
              const VerticalSpacer(space: 32),
              const OrDivider(),
              const VerticalSpacer(space: 24),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
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

                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = false;
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: false);

                    Navigator.pushReplacementNamed(
                        context, RouteConstants.homePage);
                  }else  if (state is NewUserState) {
                    showCustomSnackBar(
                        context, 'Welcome', ColorConsatnts.primary,
                        duration: 8);
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.completeLoginView);
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
                      ServiceLocator.getIt<AuthenticationCubit>().registerWithGoogle();
                    },
                    child: const LogInWithContainer(
                      label: "LogIn With Gmail",
                      color: Colors.red,
                      imagePath: AssetsConstants.gmailIcon,
                    ),
                  );
                },
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listenWhen: (previous, current) =>
                    current is SuccessLogInWithAppleState ||
                    current is ErrorLogInWithAppleState ||
                    current is LoadingLogInWithAppleState|| current is NewUserState,
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

                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = false;
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: false);

                    Navigator.pushReplacementNamed(
                        context, RouteConstants.homePage);
                  }else  if (state is NewUserState) {
                    showCustomSnackBar(
                        context, 'Welcome', ColorConsatnts.primary,
                        duration: 8);
                    Navigator.pushReplacementNamed(
                        context, RouteConstants.completeLoginView);
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
                      ServiceLocator.getIt<AuthenticationCubit>().logInWithApple();
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
