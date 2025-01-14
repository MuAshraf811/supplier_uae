import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/widgets/app_text_field.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/chat/presentation/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/app_button.dart';
import '../../../Authentication/presentation/widgets/drop_down_text_field.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: 
               Form(
                key: formKey,
                child: ListView(
                  children: [
                    const VerticalSpacer(space: 32),
                    const CustomAppbar(title: "Account View"),
                    const VerticalSpacer(space: 12),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                              label: 'First Name',
                              controller: context
                                  .read<AuthenticationCubit>()
                                  .firstNameProfileController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This field should not be embty";
                                }
                                return null;
                              },
                              suffixIcon: Icons.person_2_rounded),
                        ),
                        const HorizontalSpacer(space: 12),
                        Expanded(
                          child: AppTextField(
                              label: 'Last Name',
                              suffixIcon: Icons.person_2_rounded,
                              controller: context
                                  .read<AuthenticationCubit>()
                                  .lastNameProfileController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This field should not be embty";
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                    const VerticalSpacer(space: 10),
                    AppTextField(
                      label: "Example12@email.com",
                      readOnly: true,
                      suffixIcon: Icons.email,
                      controller: context
                          .read<AuthenticationCubit>()
                          .emailProfileController,
                    ),
                    const VerticalSpacer(space: 10),
                    AppTextField(
                      label: "Mobile Number",
                      type: TextInputType.phone,
                      controller: context
                          .read<AuthenticationCubit>()
                          .mobileProfileController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "This field should not be empty";
                        }
                        return null;
                      },
                      suffixIcon: Icons.phone_android_outlined,
                    ),
                    const VerticalSpacer(space: 10),
                    Row(
                      children: [
                        Text(
                          " City :",
                          style: applySemiBoldStyle(
                            fontSize: 16,
                            fontColor: ColorConsatnts.black,
                          ),
                        ),
                        const HorizontalSpacer(space: 10),
                        const Expanded(
                          child: DropDownWithTextField(),
                        ),
                      ],
                    ),
                    const VerticalSpacer(space: 48),
                    AppButton(
                      text: "Change Password",
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.changePasswordView);
                      },
                    ),
                    const VerticalSpacer(space: 12),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      buildWhen: (previous, current) =>
                          current is UpdateUserDataErrorState ||
                          current is UpdatingUserDataSuccessState ||
                          current is UpdatingUserDataState,
                      builder: (context, state) {
                        if (state is UpdatingUserDataState) {
                          return Container(
                            width: double.infinity,
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: ColorConsatnts.primary,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: ColorConsatnts.white,
                              ),
                            ),
                          );
                        }
                        return AppButton(
                          text: "Update Information",
                          onTap: () {
                            if (formKey
                                .currentState!
                                .validate()) {
                              context
                                  .read<AuthenticationCubit>()
                                  .updateUserInfo();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            
        ),
      ),
    );
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
              const CustomAppbar(title: "Change Password View"),
              const VerticalSpacer(space: 16),
              const AppTextField(
                  label: "Enter Old Password",
                  suffixIcon: Icons.remove_red_eye),
              const VerticalSpacer(space: 6),
              const AppTextField(
                  label: "Enter New Password",
                  suffixIcon: Icons.remove_red_eye),
              const VerticalSpacer(space: 6),
              //const PasswordValidationPart(),
              const VerticalSpacer(space: 10),
              const AppTextField(
                  label: "Confirm New Password",
                  suffixIcon: Icons.remove_red_eye_rounded),
              const VerticalSpacer(space: 16),
              AppButton(text: "Change", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
