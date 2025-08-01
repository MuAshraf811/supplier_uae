import 'package:supplier_app/core/utils/widgets/custom_phone_field.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';
import '../../../../client/Authentication/presentation/widgets/drop_down_text_field.dart';

class StepOneContent extends StatelessWidget {
  final stepOneFormKey;

  const StepOneContent({super.key, required this.stepOneFormKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: stepOneFormKey,
      child: Column(
        children: [
          AppTextField(
            label: "Example12@email.com",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }else if(val.endsWith(".com")==false && !val.endsWith(".net") ){
                return "Enter Valid Email";
              } else if (val.contains("@")==false){
                return "Enter Valid Email";
              }
              return null;
            },
            suffixIcon: Icons.email,
            controller:
                context.read<SupplierAuthCubit>().emailRegisterController,
          ),
          const VerticalSpacer(space: 10),
          AppTextField(
            label: "Enter Password",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }else if(val.length<=7){
                return "Password should be 8 or more digits";
              }
              return null;
            },
            suffixIcon: Icons.remove_red_eye,
            controller:
                context.read<SupplierAuthCubit>().passwordRegisterController,
          ),
          const VerticalSpacer(space: 6),
          // PasswordValidationPart(
          //   ctx: context,
          // ),
          const VerticalSpacer(space: 10),
          AppTextField(
            label: "Confirm Password",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              } else if (context.read<SupplierAuthCubit>().passwordRegisterController.text !=context
                .read<SupplierAuthCubit>()
                .confirmPasswordRegisterController.text ){
                  return"Passwords don't match" ;
                }
              return null;
            },
            suffixIcon: Icons.remove_red_eye_rounded,
            controller: context
                .read<SupplierAuthCubit>()
                .confirmPasswordRegisterController,
          ),
          const VerticalSpacer(space: 10),
          CustomPhoneField(
              context: context,
              thePhoneController: context.read<SupplierAuthCubit>().thePhoneController,
              myWidth: MediaQuery.of(context).size.width),

          const VerticalSpacer(space: 10),
          Row(
            children: [
              Text(
                " City : ",
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.black,
                ),
              ),
              const HorizontalSpacer(space: 10),
              Expanded(
                child: DropDownWithTextField(
                  onchanged: (p0) {
                    context.read<SupplierAuthCubit>().citySelection =
                        p0 ?? "Dubai";
                  },
                ),
              ),
            ],
          ),
          const VerticalSpacer(space: 24),
        ],
      ),
    );
  }
}

class StepTwoContent extends StatelessWidget {
  final stepTwoFormKey;

  const StepTwoContent({super.key, required this.stepTwoFormKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: stepTwoFormKey,
      child: Column(
        children: [
          const VerticalSpacer(space: 16),
          InkWell(
            onTap: () {
              context.read<SupplierAuthCubit>().getTradeLisence();  

            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 22.h),
              height: 80.h,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConsatnts.primary),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlocConsumer<SupplierAuthCubit, SupplierAuthState>( 
                        buildWhen: (previous, current) => current is FetchingTradeLisenceErrorState|| current is FetchingTradeLisenceState || current is FetchingTradeLisenceSuccessState,
                        listenWhen: (previous, current) => current is FetchingTradeLisenceErrorState|| current is FetchingTradeLisenceState || current is FetchingTradeLisenceSuccessState,
                        listener: (context, state) {
                          if (state is FetchingTradeLisenceErrorState){ 
                            showCustomSnackBar(context, state.error, ColorConsatnts.red);
                          }
                        },
                        builder: (context, state) { 
                          if (state is FetchingTradeLisenceSuccessState){
                             return Container(
                            width: 60.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.r),
                              color: ColorConsatnts.white,
                              image: 

                                  DecorationImage( 
                                    fit: BoxFit.cover,
                                          image: FileImage(
                                            context
                                                .read<SupplierAuthCubit>()
                                                .imageFile!,
                                          ),
                                        ),
                                      
                            ),
                          );
                          }
                          return Container(
                            width: 40.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: ColorConsatnts.white,
                             
                            ),
                          );
                        },
                      ),
                      Text(
                        "Upload Trade License",
                        style: applySemiBoldStyle(
                          fontSize: 16,
                          fontColor: ColorConsatnts.black,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacer(space: 10),
                  const SvgHandler(
                      imagePath: "assets/svgs/export2.svg",
                      height: 24,
                      width: 24),
                ],
              ),
            ),
          ),
          AppTextField(
            label: "Company Name",
            suffixIcon: Icons.password_sharp,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }
              return null;
            },
            controller:
                context.read<SupplierAuthCubit>().companyNameRegisterController,
          ),
          const VerticalSpacer(space: 12),
          AppTextField(
            label: "Tax Number",
            suffixIcon: Icons.password_sharp,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }
              if(val.length != 15){
                return "Tax number length must be 15";
              }
              return null;
            },
            controller: context.read<SupplierAuthCubit>().taxNumberController,
          ),
          const VerticalSpacer(space: 12),
          AppTextField(
            label: "Bank Name",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }
              return null;
            },
            suffixIcon: Icons.account_balance_outlined,
            controller:
                context.read<SupplierAuthCubit>().bankNameRegisterController,
          ),
          const VerticalSpacer(space: 12),
          AppTextField(
            label: "IBAN Number",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This field should not be null";
              }
              if(val.length != 23){
                return "IBAN number length must be 23";
              }
              return null;
            },
            suffixIcon: Icons.credit_card_sharp,
            controller: context.read<SupplierAuthCubit>().ipanNumberController,
          ),
          const VerticalSpacer(space: 24),
        ],
      ),
    );
  }
}
