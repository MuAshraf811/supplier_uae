import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/widgets/custom_app_bar.dart';
import 'package:supplier/core/utils/widgets/snack_bar.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/Authentication/presentation/widgets/drop_down_text_field.dart';
import 'package:supplier/features/client/Authentication/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/app_button.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../widgets/login_with_container.dart';
import '../widgets/password_validation_coulmn.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: context.read<AuthenticationCubit>().registerFormKey,
            child: ListView(
              children: [
                const VerticalSpacer(space: 18),
                const GeneralAppBar(title: "Register Page", isBackArrowShown: true,),
                const VerticalSpacer(space: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This Field Shouldn't be empty";
                          }
                          return null;
                        },
                        label: 'First Name',
                        maxHeight: 40,
                        suffixIcon: Icons.person_2_rounded,
                        controller: context
                            .read<AuthenticationCubit>()
                            .firstNameRegisterController,
                      ),
                    ),
                    const HorizontalSpacer(space: 12),
                    Expanded(
                      child: AppTextField(
                        label: 'Last Name',
                        maxHeight: 40,
                        suffixIcon: Icons.person_2_rounded,
                        controller: context
                            .read<AuthenticationCubit>()
                            .lastNameRegisterController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This Field Shouldn't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const VerticalSpacer(space: 8),
                AppTextField(
                  label: "Example12@email.com",
                  maxHeight: 40,
                  suffixIcon: Icons.email,
                  controller: context
                      .read<AuthenticationCubit>()
                      .emailRegisterController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field Shouldn't be empty";
                    }
                    return null;
                  },
                ),
                const VerticalSpacer(space: 8),
                AppTextField(
                  label: "Enter Password",
                  maxHeight: 40,
                  suffixIcon: Icons.remove_red_eye,
                  controller: context
                      .read<AuthenticationCubit>()
                      .passwordRegisterController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field Shouldn't be empty";
                    }
                    if (!context.read<AuthenticationCubit>().isMoreThan8 ||
                        !context.read<AuthenticationCubit>().isNumber ||
                        !context.read<AuthenticationCubit>().isSpecial ||
                        !context.read<AuthenticationCubit>().isUpperCase) {
                      return "Read Password Roles Under This Field";
                    }
                    return null;
                  },
                ),
                const VerticalSpacer(space: 6),
                PasswordValidationPart(ctx: context),
                const VerticalSpacer(space: 8),
                AppTextField(
                  label: "Confirm Password",
                  maxHeight: 40,
                  suffixIcon: Icons.remove_red_eye_rounded,
                  controller: context
                      .read<AuthenticationCubit>()
                      .passwordConfirmationRegisterController,
                  validator: (value) {
                    if (context
                            .read<AuthenticationCubit>()
                            .passwordRegisterController
                            .text !=
                        context
                            .read<AuthenticationCubit>()
                            .passwordConfirmationRegisterController
                            .text) {
                      return "2 Passwords Must Be Same";
                    }
                    if (value == null || value.isEmpty) {
                      return "This Field Shouldn't be empty";
                    }
                    return null;
                  },
                ),
                const VerticalSpacer(space: 8),
                AppTextField(
                  label: "Mobile Number",
                  maxHeight: 40,
                  controller: context
                      .read<AuthenticationCubit>()
                      .mobileNumberRegisterController,
                  type: TextInputType.phone,
                  suffixIcon: Icons.phone_android_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field Shouldn't be empty";
                    }
                    return null;
                  },
                ),
                const VerticalSpacer(space: 10),
                Row(
                  children: [
                    Text(
                      " City :",
                      style: applyMediumStyle(
                        fontSize: 15,
                        fontColor: ColorConsatnts.black,
                      ),
                    ),
                    const HorizontalSpacer(space: 10),
                    const Expanded(
                      child: DropDownWithTextField(),
                    ),
                  ],
                ),
                const VerticalSpacer(space: 10),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is ErrorAuthenticationWithEmailState) {
                      showCustomSnackBar(context, state.error, Colors.red,
                          duration: 8);
                    }

                    if (state is SuccessAuthenticationWithEmailState) {
                      showCustomSnackBar(context, "Successful Registeration ",
                          ColorConsatnts.primary,
                          duration: 3);
                      showTermsAndConditionsDialog(context, false);
                    }
                   
                    if (state is AddingUserDataErrorState) {
                      showCustomSnackBar(
                          context, state.error, ColorConsatnts.red,
                          duration: 3);
                    }
                  },
                  listenWhen: (previous, current) =>
                      current is SuccessAuthenticationWithEmailState ||
                      current is ErrorAuthenticationWithEmailState ||
                      current is LoadingAuthenticationWithEmailState ||
                      current is AddingUserDataErrorState ||
                      current is AddingUserDataSuccessState,
                  buildWhen: (previous, current) =>
                      current is SuccessAuthenticationWithEmailState ||
                      current is ErrorAuthenticationWithEmailState ||
                      current is LoadingAuthenticationWithEmailState|| 
                        current is AddingUserDataErrorState ||
                      current is AddingUserDataSuccessState, 
                  builder: (context, state) {
                    if (state is LoadingAuthenticationWithEmailState) {
                      return Container(
                        width: double.infinity,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: ColorConsatnts.primary,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Transform.scale(
                            scale: 0.7,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: ColorConsatnts.primary,
                              valueColor: AlwaysStoppedAnimation(
                                  ColorConsatnts.white.withOpacity(0.85)),
                            ),
                          ),
                        ),
                      );
                    }
                    return AppButton(
                      text: "Register",
                      onTap: () {
                        if (context
                            .read<AuthenticationCubit>()
                            .registerFormKey
                            .currentState!
                            .validate()) {
                          context
                              .read<AuthenticationCubit>()
                              .registerWithEmail();
                          context
                              .read<AuthenticationCubit>()
                              .addUserToDataBase();
                          //  showTermsAndConditionsDialog(context, false);
                        }
                      },
                    );
                  },
                ),
                const VerticalSpacer(space: 14),
                const OrDivider(),
                const VerticalSpacer(space: 14),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listenWhen: (previous, current) =>
                      current is SuccessLogInWithGoogleState ||
                      current is ErrorLogInWithGoogleState ||
                      current is LoadingLogInWithGoogleState,
                  buildWhen: (previous, current) =>
                      current is SuccessLogInWithGoogleState ||
                      current is LoadingLogInWithGoogleState ||
                      current is ErrorLogInWithGoogleState,
                  listener: (context, state) {
                    if (state is ErrorLogInWithGoogleState) {
                      showCustomSnackBar(context, state.error, Colors.red,
                          duration: 8);
                      if (state is SuccessLogInWithGoogleState) {
                        Navigator.pushReplacementNamed(
                        context, RouteConstants.completeLoginView);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingLogInWithGoogleState) {
                      return Container(
                        width: double.infinity,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: ColorConsatnts.white,
                            border: Border.all(color: ColorConsatnts.primary),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Transform.scale(
                            scale: 0.7,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: ColorConsatnts.white,
                              valueColor: AlwaysStoppedAnimation(
                                  ColorConsatnts.primary.withOpacity(0.85)),
                            ),
                          ),
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        context
                            .read<AuthenticationCubit>()
                            .registerWithGoogle();
                      },
                      child: const LogInWithContainer(
                        label: "Register With Gmail",
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
                        context, RouteConstants.homePage);
                  } else if (state is NewUserStata) {
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
                      context.read<AuthenticationCubit>().logInWithApple();
                    },
                    child: const LogInWithContainer(
                      label: "LogIn With Apple",
                      imagePath: AssetsConstants.iosIcon,
                    ),
                  );
                },
              ),
                const VerticalSpacer(space: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
