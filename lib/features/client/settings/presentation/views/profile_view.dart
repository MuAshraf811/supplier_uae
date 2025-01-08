import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/home/presentatoin/widgets/custom_drop_down.dart';
import 'package:supplier/features/client/settings/presentation/controller/cubit/settings_cubit.dart';
import 'package:supplier/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants/storage_const.dart';
import '../../../../../core/utils/storage/shared_preferences.dart';
import '../../../../../core/utils/widgets/custom_dialog.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SingleChildScrollView(
        child: Column(
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
              child: ListView.builder(
                physics:const  NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 85.w),
                scrollDirection: Axis.horizontal,
                itemCount: AppConst.socialMediaIcons.length,
                itemBuilder: (context, index) => SocialMdiaIcons(
                  onTap: () {
                    context.read<SettingsCubit>().launchUrl(url: AppConst.socialMediaLinks[index]);
                  },
                  icon: AppConst.socialMediaIcons[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMdiaIcons extends StatelessWidget {
  const SocialMdiaIcons({
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
              Navigator.pushNamed(context, RouteConstants.accountView);
            case 1:
              Navigator.pushNamed(
                  context, RouteConstants.termsAndConditionsView);
             case 3:
              showCustomDialog(context, title: "Delete Account", onConfirm: () {
                SharedPreferencesManager.storeBoolValue(
                    key: AppConst.isUserLogged, value: false);
                Navigator.pushReplacementNamed(
                    context, RouteConstants.userTypeView);
              }, buttonText: "Delete");
            case 4:
              showCustomDialog(context, title: "Log Out", onConfirm: () async {
                SharedPreferencesManager.storeBoolValue(
                    key: AppConst.isUserLogged, value: false);
                SharedPreferencesManager.storeBoolValue(
                    key: AppConst.isSupplier, value: false);
                AppConfigCubit.isUserLogged = false;
                AppConfigCubit.isSupplier=false;
                // await  SharedPreferencesManager.storeStringValue(
                //     key: StorageConstants.userDataId,
                //     value: ''
                // );
                Navigator.pushReplacementNamed(
                    context, RouteConstants.userTypeView);
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
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).language,
            style:
                applyBoldStyle(fontSize: 15, fontColor: ColorConsatnts.black),
          ),
          CustomDropDown(
            onSelected: (val) {
              context.read<AppConfigCubit>().changeLanguage(val);
            },
            text: "",
            entries: const [
              "en",
              "ar",
            ],
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
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      buildWhen: (previous, current) =>
          current is FetchUserDataErrorState ||
          current is FetchingUserDataState ||
          current is FetchingUserDataSuccessState,
      builder: (context, state) {
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
                ),
                const HorizontalSpacer(space: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userModel.firstName} ${userModel.lastName}",
                      style: applyBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.black,
                      ),
                    ),
                    Text(
                      userModel.city,
                      style: applySemiBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.lightBlack,
                      ),
                    ),
                    Text(
                      userModel.email,
                      style: applySemiBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.primary,
                      ),
                    ),
                    Text(
                      userModel.mobileNumber,
                      style: applySemiBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.lightBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is FetchUserDataErrorState) {
          return Text(state.error);
        }
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
                  width: 140.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(14.r)),
                ),
                Container(
                  width: 180.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
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
                  width: 100.w,
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
