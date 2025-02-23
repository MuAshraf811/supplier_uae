import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/custom_phone_field.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/Authentication/presentation/widgets/drop_down_text_field.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/snack_bar.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../cubit/supplier_auth_cubit.dart';

class SupplierCompleteLoginView extends StatelessWidget {
  SupplierCompleteLoginView({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const VerticalSpacer(space: 18),
                const GeneralAppBar(title: "Complete Registration", isBackArrowShown: true,),
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
                        label: 'Company Name',
                        maxHeight: 40,
                        suffixIcon: Icons.person_2_rounded,
                        controller: context.read<SupplierAuthCubit>()
                            .companyNameRegisterController,
                      ),
                    ),
                    const HorizontalSpacer(space: 12),
                    Expanded(
                      child: AppTextField(
                        label: 'Tax Number',
                        maxHeight: 40,
                        suffixIcon: Icons.person_2_rounded,
                        controller: context.read<SupplierAuthCubit>()
                            .taxNumberController,
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
              
                CustomPhoneField(
                    context: context,
                    thePhoneController: context.read<SupplierAuthCubit>().thePhoneController,
                    myWidth: MediaQuery.of(context).size.width),
                VerticalSpacer(space: 20),
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
                BlocConsumer<SupplierAuthCubit, SupplierAuthState>(
                  listener: (context, state) {
                    if (state is AddingSupplierDataSuccessState) {
                      showCustomSnackBar(context, "Successful Registration ",
                          ColorConsatnts.primary,
                          duration: 3);
                      showTermsAndConditionsDialog(context, true);
                    }
                    if (state is AddingSupplierDataErrorState) {
                      showCustomSnackBar(
                          context, 'Something went wrong', ColorConsatnts.red,
                          duration: 3);
                    }
                  },
                  // listenWhen: (previous, current) =>
                  //     current is AddingUserDataErrorState ||
                  //     current is AddingUserDataSuccessState,
                  // buildWhen: (previous, current) =>
                  //      current is AddingUserDataState||
                  //       current is AddingUserDataErrorState ||
                  //     current is AddingUserDataSuccessState,
                  builder: (context, state) {
                    if (state is AddingUserDataState) {
                      return Container(
                        width: double.infinity,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: ColorConsatnts.primary,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Transform.scale(
                            scale: 0.95,
                            child:const CircularProgressIndicator.adaptive(
                              backgroundColor: ColorConsatnts.primary,
                             
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
                          ServiceLocator.getIt<SupplierAuthCubit>()
                              .easyAddSupplier();
                          //  showTermsAndConditionsDialog(context, false);
                        }
                      },
                    );
                  },
                ),
                const VerticalSpacer(space: 14),
            
              ],
            ),
          ),
        ),
    );

  }
}