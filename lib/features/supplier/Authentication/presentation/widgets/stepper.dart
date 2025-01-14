import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:supplier/features/supplier/Authentication/presentation/widgets/steps_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/snack_bar.dart';
import '../../../../../core/utils/widgets/spacers.dart';

class RegisterStepper extends StatefulWidget {
  const RegisterStepper({
    super.key,
  });

  @override
  State<RegisterStepper> createState() => _RegisterStepperState();
}

class _RegisterStepperState extends State<RegisterStepper> {
  int stepIndex = 0;

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
                  return AppButton(
                    text: details.currentStep == 0 ? "Continue" : "Register",
                    onTap: () {
                      if (stepIndex == 0) {
                        if (stepOneFormKey
                            .currentState!
                            .validate()) {
                          setState(
                            () {
                              stepIndex++;
                            },
                          );
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
