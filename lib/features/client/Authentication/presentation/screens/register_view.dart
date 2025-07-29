import 'package:phone_form_field/phone_form_field.dart';
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/core/utils/widgets/custom_app_bar.dart';
import 'package:supplier_app/core/utils/widgets/custom_phone_field.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier_app/features/client/Authentication/otp/otp_remote_data_source_firebase_impl.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier_app/features/client/Authentication/presentation/widgets/drop_down_text_field.dart';
import 'package:supplier_app/features/client/Authentication/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/app_button.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../widgets/login_with_container.dart';
import '../widgets/password_validation_coulmn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();

  PhoneController thePhoneController = PhoneController(initialValue: PhoneNumber.parse("+971"));

  TextEditingController otpController = TextEditingController();

  bool isVerifyPressed= false;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {

      },
      builder:(context, state) =>  Scaffold(
        backgroundColor: ColorConsatnts.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
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
                          controller: ServiceLocator.getIt<AuthenticationCubit>()
                              .firstNameRegisterController,
                        ),
                      ),
                      const HorizontalSpacer(space: 12),
                      Expanded(
                        child: AppTextField(
                          label: 'Last Name',
                          maxHeight: 40,
                          suffixIcon: Icons.person_2_rounded,
                          controller: ServiceLocator.getIt<AuthenticationCubit>()
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
                    controller: ServiceLocator.getIt<AuthenticationCubit>()
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
                    controller: ServiceLocator.getIt<AuthenticationCubit>()
                        .passwordRegisterController,
                    onChange: (p0) {
                      ServiceLocator.getIt<AuthenticationCubit>().passwordChangeNotifier();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Field Shouldn't be empty";
                      }
                      if (!ServiceLocator.getIt<AuthenticationCubit>().isMoreThan8 ||
                          !ServiceLocator.getIt<AuthenticationCubit>().isNumber ||
                          !ServiceLocator.getIt<AuthenticationCubit>().isSpecial ||
                          !ServiceLocator.getIt<AuthenticationCubit>().isUpperCase) {
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
                    controller: ServiceLocator.getIt<AuthenticationCubit>()
                        .passwordConfirmationRegisterController,
                    onChange: (p0) {
                      ServiceLocator.getIt<AuthenticationCubit>().passwordChangeNotifier();
                    },
                    validator: (value) {
                      if (ServiceLocator.getIt<AuthenticationCubit>()
                              .passwordRegisterController
                              .text !=
                          ServiceLocator.getIt<AuthenticationCubit>()
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
                  CustomPhoneField(context: context, thePhoneController: thePhoneController, myWidth: MediaQuery.of(context).size.width),
                  // AppTextField(
                  //   label: "Mobile Number",
                  //   maxHeight: 40,
                  //   controller: ServiceLocator.getIt<AuthenticationCubit>()
                  //       .mobileNumberRegisterController,
                  //   type: TextInputType.phone,
                  //   suffixIcon: Icons.phone_android_outlined,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "This Field Shouldn't be empty";
                  //     }
                  //     return null;
                  //   },
                  // ),
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
                        showCustomSnackBar(context, "Successful Registration ",
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
                          if (formKey
                              .currentState!
                              .validate()) {

                            ServiceLocator.getIt<AuthenticationCubit>()
                                .mobileNumberRegisterController.text = "+${thePhoneController.value.countryCode}${thePhoneController.value.nsn}";


                            ServiceLocator.getIt<OtpRemoteDataSourceFirebaseImpl>()
                                .sendOtp(mobile: "+${thePhoneController.value.countryCode}${thePhoneController.value.nsn}")
                                .then((value) {
                                  if(value.success){
                                    showDialog(
                                      context: context,
                                      builder: (context) => Scaffold(
                                        appBar: AppBar(
                                          leading: IconButton(
                                              onPressed: () => Navigator.of(context).pop(),
                                              icon: const Icon(Icons.close)),
                                        ),
                                        body: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 50,),
                                                const Text("Enter Verification Code below",style: TextStyle(fontSize: 20,),maxLines: 2,),
                                                const SizedBox(height: 20,),
                                                AppTextField(
                                                  label: "Otp code",
                                                  type: TextInputType.number,
                                                  suffixIcon: Icons.numbers,
                                                  controller: otpController,
                                                ),
                                                VerticalSpacer(space: 20),
                                                isVerifyPressed?
                                                const Center(child: CircularProgressIndicator(),):
                                                AppButton(text: "Verify Code", onTap: () {
                                                  setState(() {
                                                    isVerifyPressed = true;
                                                  });
                                                  ServiceLocator.getIt<OtpRemoteDataSourceFirebaseImpl>()
                                                      .verifyOtp(userCode: otpController.text)
                                                      .then((value) {
                                                    setState(() {
                                                      isVerifyPressed = false;
                                                    });
                                                    if(value.success){
                                                      showCustomSnackBar(context, "Code Verified", Colors.green);
                                                      Navigator.of(context).pop();
                                                      ServiceLocator.getIt<AuthenticationCubit>()
                                                          .registerWithEmail().then((value) {
                                                        if(value){
                                                          ServiceLocator.getIt<AuthenticationCubit>()
                                                              .addUserToDataBase().then((value) {

                                                          },);
                                                            }
                                                      },);
                                                    }else{
                                                      showCustomSnackBar(context, value.message, Colors.redAccent);
                                                    }
                                                  },);
                                                },),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ) ,);
                                    showCustomSnackBar(context, "Code sent successfully", Colors.green);
                                  }else{
                                    showCustomSnackBar(context, value.message, Colors.redAccent);
                                  }
                            },);
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

                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = false;
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: false);

                          Navigator.pushReplacementNamed(
                          context, RouteConstants.homePage);
                        }
                        else if (state is NewUserState){
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
                          ServiceLocator.getIt<AuthenticationCubit>()
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
                    } else if (state is NewUserState) {
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
                  const VerticalSpacer(space: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
