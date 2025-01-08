import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/custom_dialog.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/home/presentatoin/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../../core/utils/constants/storage_const.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
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
            "Find Us On",
            style: applyBoldStyle(fontSize: 14, fontColor: ColorConsatnts.grey),
          ),
          const VerticalSpacer(space: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMdiaIcons(icon: AssetsConstants.facebookIcon),
              HorizontalSpacer(space: 18),
              SocialMdiaIcons(icon: AssetsConstants.instagramIcon),
              HorizontalSpacer(space: 18),
              SocialMdiaIcons(icon: AssetsConstants.whatsupIcon),
              HorizontalSpacer(space: 18),
              SocialMdiaIcons(icon: AssetsConstants.linkedInIcon),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialMdiaIcons extends StatelessWidget {
  const SocialMdiaIcons({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgHandler(
      imagePath: icon,
      height: 24,
      width: 24,
      color: ColorConsatnts.primary,
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
            case 1:
              Navigator.pushNamed(
                  context, RouteConstants.termsAndConditionsView);
            case 2:
            case 3:
              showCustomDialog(context, title: "Delete Account", onConfirm: () {
                SharedPreferencesManager.storeBoolValue(
                    key: AppConst.isUserLogged, value: false);
                Navigator.pushReplacementNamed(
                    context, RouteConstants.userTypeView);
              }, buttonText: "Yes");
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
            "Language",
            style:
                applyBoldStyle(fontSize: 15, fontColor: ColorConsatnts.black),
          ),
          CustomDropDown(
            onSelected: (p0) {},
            text: "",
            entries: const [
              "English",
              "Arabic",
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
                "Muhammed Ashraf Alarabi",
                style: applyBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.black,
                ),
              ),
              Text(
                "Sharkia-Egypt",
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.lightBlack,
                ),
              ),
              Text(
                "01002011850",
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
  }
}
