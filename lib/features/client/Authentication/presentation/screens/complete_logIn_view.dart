import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/custom_phone_field.dart';
import 'package:supplier_app/core/utils/widgets/terms_and_conditions_dialog.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier_app/features/client/Authentication/presentation/widgets/drop_down_text_field.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/widgets/app_text_field.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/snack_bar.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../otp/otp_remote_data_source_firebase_impl.dart';

class CompleteLoginView extends StatelessWidget {
  CompleteLoginView({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  PhoneController thePhoneController = PhoneController(initialValue: PhoneNumber.parse('+971'));
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
                // Row(
                //   children: [
                //     Expanded(
                //       child: AppTextField(
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return "This Field Shouldn't be empty";
                //           }
                //           return null;
                //         },
                //         label: 'First Name',
                //         maxHeight: 40,
                //         suffixIcon: Icons.person_2_rounded,
                //         controller: context.read<AuthenticationCubit>()
                //             .firstNameRegisterController,
                //       ),
                //     ),
                //     const HorizontalSpacer(space: 12),
                //     Expanded(
                //       child: AppTextField(
                //         label: 'Last Name',
                //         maxHeight: 40,
                //         suffixIcon: Icons.person_2_rounded,
                //         controller: context.read<AuthenticationCubit>()
                //             .lastNameRegisterController,
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return "This Field Shouldn't be empty";
                //           }
                //           return null;
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              
                // const VerticalSpacer(space: 8),
              
            
                const VerticalSpacer(space: 8),
                CustomPhoneField(
                    context: context, thePhoneController: thePhoneController, myWidth: MediaQuery.of(context).size.width),
                // AppTextField(
                //   label: "Mobile Number",
                //   maxHeight: 40,
                //   controller: context.read<AuthenticationCubit>()
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
                    if (state is AddingUserDataSuccessState) {

                      
                    AppConfigCubit.isLogged = true;
                    AppConfigCubit.isSupplier = false;
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isUserLoggedKey, value: true);
                    SharedPreferencesManager.storeBoolValue(
                        key: StorageConstants.isSupplierKey, value: false);

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
                          context.read<AuthenticationCubit>()
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
                                          const VerticalSpacer(space: 20),
                                          AppButton(text: "Verify Code", onTap: () {
                                            if(otpController.text.isNotEmpty){
                                            ServiceLocator.getIt<OtpRemoteDataSourceFirebaseImpl>().verifyOtp(userCode: otpController.text).then((value) {
                                              if(value.success){
                                                showCustomSnackBar(context, "Code Verified", Colors.green);
                                                Navigator.of(context).pop();

                                                ServiceLocator.getIt<AuthenticationCubit>()
                                                    .addUserToDataBaseWithOtherMethods();
                                              }else{
                                                showCustomSnackBar(context, value.message, Colors.redAccent);
                                              }
                                            },);
                                            }
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
            
              ],
            ),
          ),
        ),
    );

  }
}