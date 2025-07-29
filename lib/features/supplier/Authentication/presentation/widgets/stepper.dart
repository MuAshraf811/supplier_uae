import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/widgets/steps_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../../core/utils/widgets/snack_bar.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../client/Authentication/otp/otp_remote_data_source_firebase_impl.dart';
import '../../../../client/Authentication/presentation/controllers/auth/authentication_cubit.dart';

class RegisterStepper extends StatefulWidget {
  const RegisterStepper({
    super.key,
  });

  @override
  State<RegisterStepper> createState() => _RegisterStepperState();
}

class _RegisterStepperState extends State<RegisterStepper> {
  int stepIndex = 0;
  TextEditingController otpController = TextEditingController();
  bool isContinueClicked = false;
  bool isVerifyClicked = false;

  final stepOneFormKey = GlobalKey<FormState>();
  final stepTwoFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: ColorConsatnts.white),
      child: Stepper(
        controlsBuilder: (context, details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<SupplierAuthCubit, SupplierAuthState>(
                buildWhen: (previous, current) =>
                    current is UploadingTradeLisenceErrorState ||
                    current is UploadingTradeLisenceState ||
                    current is UploadingTradeLisenceSuccessState||   current is UploadingUserState ||    current is UploadingUserStateSuccessState || current is UploadingUserStateErrorState,
                listenWhen: (previous, current) =>
                    current is UploadingTradeLisenceErrorState ||
                    current is UploadingTradeLisenceState ||
                    current is UploadingTradeLisenceSuccessState ||  current is UploadingUserState ||    current is UploadingUserStateSuccessState || current is UploadingUserStateErrorState ,
                listener: (context, state) {
                  if (state is UploadingTradeLisenceErrorState) {
                    showCustomSnackBar(
                        context, state.error, ColorConsatnts.red);
                  }
                    if (state is UploadingUserStateErrorState) {
                    showCustomSnackBar(
                        context, state.error, ColorConsatnts.red);
                  }
                  if (state is UploadingUserStateSuccessState){
                     showTermsAndConditionsDialog(context, true);

                  }
                },
                builder: (context, state) {
                  if ( state is UploadingUserState || state is UploadingTradeLisenceState) {
                    return Container(
                      margin: EdgeInsets.only(right: 24.w),
                      width: 20.w,
                      height: 20.h,
                        child: const CircularProgressIndicator.adaptive());
                  }
                  return details.currentStep == 0 && isContinueClicked?
                      const Center(child: CircularProgressIndicator(),)
                      :AppButton(
                    text: details.currentStep == 0 ? "Continue" : "Register",
                    onTap: () {
                      if (stepIndex == 0) {
                        if (stepOneFormKey
                            .currentState!
                            .validate()) {
                          setState(() {
                            isContinueClicked = true;
                          });
                          ServiceLocator.getIt<OtpRemoteDataSourceFirebaseImpl>()
                              .sendOtp(mobile: "+${context.read<SupplierAuthCubit>().thePhoneController.value.countryCode}${context.read<SupplierAuthCubit>().thePhoneController.value.nsn}")
                              .then((value) {
                            if(value.success){
                              setState(() {
                                isContinueClicked = false;
                              });
                              showDialog(
                                context: context,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Scaffold(
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
                                            details.currentStep == 0 && isVerifyClicked?
                                            const Center(child: CircularProgressIndicator(),)
                                            : AppButton(text: "Verify Code", onTap: () {
                                              if(otpController.text.isNotEmpty){
                                                setState(() {
                                                  isVerifyClicked = true;
                                                });
                                                ServiceLocator.getIt<OtpRemoteDataSourceFirebaseImpl>().verifyOtp(userCode: otpController.text).then((value) {
                                                  if(value.success){
                                                    showCustomSnackBar(context, "Code Verified", Colors.green);
                                                    Navigator.of(context).pop();
                                                    setState(
                                                          () {
                                                        isVerifyClicked = false;
                                                        stepIndex++;
                                                      },
                                                    );
                                                  }else{
                                                    setState(() {
                                                      isVerifyClicked = false;
                                                    });
                                                    showCustomSnackBar(context, value.message, Colors.redAccent);
                                                  }
                                                },);
                                              }
                                            },),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ) ,);
                              showCustomSnackBar(context, "Code sent successfully", Colors.green);
                            }else{
                              setState(() {
                                isContinueClicked = false;
                              });
                              showCustomSnackBar(context, value.message, Colors.redAccent);
                            }
                          },);

                        }
                      } else {
                        if (stepTwoFormKey
                            .currentState!
                            .validate()) {
                              //   context
                              // .read<SupplierAuthCubit>()
                              // .uploadTradeLisence();
                        if(context.read<SupplierAuthCubit>().imageFile==null){
                           showCustomSnackBar(context, "Upload Licence", ColorConsatnts.red);
                        }
                        print('register');
                         context.read<SupplierAuthCubit>().registerSupplierData();


                        }
                      }
                    },
                    width: 100.w,
                    raduis: 6.r,
                    fontSize: 15,
                  );
                },
              ),
              const HorizontalSpacer(space: 12),
              AppButton(
                text: "Cancel",
                raduis: 6.r,
                color: ColorConsatnts.white,
                textColor: ColorConsatnts.primary,
                onTap: () {
                  if (stepIndex == 1) {
                    setState(() {
                      stepIndex--;
                    });
                  }else{
                    Navigator.pop(context);
                  }
                },
                width: 80.w,
                fontSize: 15,
              ),
            ],
          );
        },
        connectorColor: const WidgetStatePropertyAll(ColorConsatnts.primary),
        currentStep: stepIndex,
        type: StepperType.horizontal,
        steps: [
          Step(
            state: stepIndex == 1 ? StepState.complete : StepState.indexed,
            stepStyle: StepStyle(
              color: stepIndex == 1 ? Colors.green : ColorConsatnts.primary,
            ),
            title: Text(
              "Main Data",
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
            content: StepOneContent(stepOneFormKey: stepOneFormKey),
          ),
          Step(
            //  isActive: false,
            state: StepState.disabled,
            stepStyle: StepStyle(
              color: stepIndex == 0
                  ? ColorConsatnts.grey.withOpacity(0.85)
                  : ColorConsatnts.primary,
            ),
            title: Text(
              "Other Data",
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
            content: StepTwoContent(stepTwoFormKey: stepTwoFormKey,),
          ),
        ],
      ),
    );
  }
}
