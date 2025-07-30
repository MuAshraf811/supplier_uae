import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/service_locator.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/client/Authentication/model/user_data_model.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier_app/features/client/home/presentatoin/widgets/custom_drop_down.dart';
import 'package:supplier_app/features/client/settings/presentation/controller/cubit/settings_cubit.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:supplier_app/features/supplier/notifications/presentation/cubit/notification_cubit.dart';
import 'package:supplier_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/constants/storage_const.dart';
import '../../../../../core/utils/storage/shared_preferences.dart';
import '../../../../../core/utils/widgets/custom_dialog.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    // if(AppConfigCubit.isSupplier) {
      ServiceLocator.getIt<SupplierAuthCubit>().getUserData();
      print('Supplier');
    // }else{
      print("Client");
      ServiceLocator.getIt<AuthenticationCubit>().getUserData();
    // }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // if( SupplierAuthCubit.supplierPersonalData.uuid == null && AppConfigCubit.isSupplier){
       ServiceLocator.getIt<SupplierAuthCubit>().getUserData();
      print('Supplier');
    // }else{
      print("Client");
      ServiceLocator.getIt<AuthenticationCubit>().getUserData();
    // }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileInformation(),
            const LanguageDropDown(),
            const VerticalSpacer(space: 12),
            SizedBox(
              height: 248.h,
              child: ListView.builder(
                itemCount: AppConst.settingsText(context).length,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemBuilder: (context, index) => SettingsItem(index: index),
              ),
            ),
            const VerticalSpacer(space: 6),
            Text(
              S.of(context).find_us_on,
              style: applyBoldStyle(fontSize: 14, fontColor: ColorConsatnts.grey),
            ),
            const VerticalSpacer(space: 16),
            SizedBox(
              height: 32.w,
              width: MediaQuery.of(context).size.width*0.9,
              child: Center(
                child: ListView.builder(
                  physics:const  NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.14),
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConst.socialMediaIcons.length,
                  itemBuilder: (context, index) {
                    if(index==3 && Platform.isIOS){
                      return const SizedBox();
                    }
                    return SocialMediaIcons(
                      onTap: () {
                        if(index==3 && Platform.isIOS){
                          Fluttertoast.showToast(msg: "This feature is not available on iOS");
                        }
                        context.read<SettingsCubit>().launchUrl(url: AppConst.socialMediaLinks[index]);
                      },
                      icon: AppConst.socialMediaIcons[index],
                    );
                  },
                            
                            
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
    required this.icon, required this.onTap,
  });
  final String icon; 
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: InkWell( 
        onTap: onTap,
        child: SvgHandler(
          imagePath: icon,
          height: 24,
          width: 24,
          color: ColorConsatnts.primary,
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: InkWell(
        onTap: () {
          switch (index) {
            case 0:
              AppConfigCubit.isSupplier?
              Navigator.pushNamed(context, RouteConstants.supplierAccountView)    :
              Navigator.pushNamed(context, RouteConstants.accountView);
            case 1:
              Navigator.pushNamed(
                  context, AppConfigCubit.isSupplier? RouteConstants.termsAndConditionsSupplierView : RouteConstants.termsAndConditionsClientView);
            case 2:
              launchUrl(Uri.parse(AppConst.websiteUrl));
             case 3:
              showCustomDialog(context, title: "Delete Account", onConfirm: () async {

                String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
                String userId =  SharedPreferencesManager
                    .getStringValue(key: StorageConstants.userId);
                
                final userData = await FirebaseFirestore.instance
                    .collection(collectionName)
                    .where('uuid', isEqualTo: userId).get();
                    if(userData.docs.isNotEmpty){
                      FirebaseFirestore.instance
                      .collection(collectionName)
                    .doc(userData.docs.first.id).delete();
                    }
                    

                SharedPreferencesManager.storeBoolValue(
                    key: StorageConstants.isUserLoggedKey, value: false);
                Navigator.pushReplacementNamed(
                    context, RouteConstants.userTypeView);
              }, buttonText: "Delete");
            case 4:
              showCustomDialog(context, title: "Log Out", onConfirm: () async {

                SharedPreferencesManager.storeBoolValue(
                    key: StorageConstants.isUserLoggedKey, value: false);
                SharedPreferencesManager.storeBoolValue(
                    key: StorageConstants.isSupplierKey, value: false);
                SharedPreferencesManager.storeStringValue(
                    key: StorageConstants.userDataIdKey,
                    value: ''
                );

                NotificationsCubit().clearNotifications();



                AppConfigCubit.isLogged = false;
                AppConfigCubit.isSupplier=false;
                AppConfigCubit.currentUserDataId = '';
                AppConfigCubit.currentUserId = '';
                // AuthenticationCubit.userPersonalData = UserDataModel(email: 'email', password: 'password', firstName: 'firstName', lastName: 'lastName', mobileNumber: 'mobileNumber', city: 'city', uuid: 'uuid');

                ServiceLocator.getIt<SupplierAuthCubit>().clearControllers();
                ServiceLocator.getIt<AuthenticationCubit>().clearControllers();
                // SharedPreferencesManager.clearCache();

                Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil(
                     RouteConstants.userTypeView,
                  (route) => false,
                );
              }, buttonText: "Log Out");
          }
        },
        child: Row(
          children: [
            SvgHandler(
              imagePath: AppConst.settingsIcon[index],
              height: 22,
              width: 22,
              color: AppConst.settingsIconColor[index],
            ),
            const HorizontalSpacer(space: 12),
            Text(
              AppConst.settingsText(context)[index],
              style: applySemiBoldStyle(
                fontSize: 15,
                fontColor: ColorConsatnts.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorConsatnts.lightBlack,
              size: 20.w,
            )
          ],
        ),
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.25,
            child: Text(
              S.of(context).language,
              style:
                  applyBoldStyle(fontSize: 15, fontColor: ColorConsatnts.black),
            ),
          ),
          SizedBox(
            // width: 200,
            child: CustomDropDown(
              width: MediaQuery.of(context).size.width*0.2,
              onSelected: (val) {
                context.read<AppConfigCubit>().changeLanguage(val);
              },
              text: "",
              entries: const [
                "English",
                "ألعربية",
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dark Mode",
            style:
                applyBoldStyle(fontSize: 15, fontColor: ColorConsatnts.black),
          ),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              activeColor: ColorConsatnts.primary,
              inactiveThumbColor: ColorConsatnts.black,
              trackOutlineColor:
                  const WidgetStatePropertyAll(ColorConsatnts.primary),
              thumbColor: const WidgetStatePropertyAll(ColorConsatnts.white),
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {

      },
      // buildWhen: (previous, current) =>
      //     current is FetchUserDataErrorState ||
      //     current is FetchingUserDataState ||
      //     current is FetchingUserDataSuccessState,
      builder:  (context, state) {
        if (state is FetchingUserDataSuccessState) {
          final userModel =
              AuthenticationCubit.userPersonalData;
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            margin: EdgeInsets.only(top: 18.h, bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: ColorConsatnts.grey,
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorConsatnts.primary,
                  radius: 32.w,
                  child: const Icon(Icons.person),
                ),
                const HorizontalSpacer(space: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AuthenticationCubit.userPersonalData.firstName} ${AuthenticationCubit.userPersonalData.lastName}",
                      style: applyBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.black,
                        
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AuthenticationCubit.userPersonalData.city,
                      style: applySemiBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.lightBlack,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Text(
                        AuthenticationCubit.userPersonalData.email,
                        overflow: TextOverflow.ellipsis,
                        style: applySemiBoldStyle(
                          fontSize: 16,
                          fontColor: ColorConsatnts.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Text(
                      AuthenticationCubit.userPersonalData.mobileNumber,
                      style: applySemiBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.lightBlack,
                      ),
                    ),)
                  ],
                ),
              ],
            ),
          );
        } else if (state is FetchUserDataErrorState) {
          return const Center(child: Text("No user data found"));
        }
        print(state);
        ServiceLocator.getIt<AuthenticationCubit>().getUserData();
        return const InfoShimmer();
      },
    );
  }
}

class InfoShimmer extends StatelessWidget {
  const InfoShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorConsatnts.grey.shade500,
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26.w,
              backgroundColor: Colors.grey.shade500,
            ),
            const HorizontalSpacer(space: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(14.r)),
                ),
                Container(
                  width: 100.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(14.r)),
                ),
                Container(
                  width: 80.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(14.r)),
                ),
                Container(
                  width: 90.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(14.r)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
