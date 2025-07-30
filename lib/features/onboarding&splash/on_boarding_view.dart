import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/features/onboarding&splash/model/onboaeding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/cubit/app_config_cubit.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _onBoardingController;
  @override
  void initState() {
    _onBoardingController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingController.dispose();
    super.dispose();
  }

  String buttonText = "Next";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.lightgrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: Column(
            children: [
              const VerticalSpacer(space: 24),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      //                     if(SharedPreferencesManager.getBoolValue(
                      //                         key: StorageConstants.isFirstTime)==null){
                      // SharedPreferencesManager.storeBoolValue(
                      //                         key: StorageConstants.isFirstTime, value: false);
                      //                          }
                      AppConfigCubit.isBoarded = true;
                      SharedPreferencesManager.storeBoolValue(
                          key: StorageConstants.isBoardedKey,
                          value: true
                      );

                      Navigator.pushReplacementNamed(
                          context, RouteConstants.userTypeView);
                    },
                    child: Text(
                      "Skip",
                      style: applyMediumStyle(
                        fontSize: 15,
                        fontColor: ColorConsatnts.primary,
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpacer(space: 32),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.75,
                child: PageView.builder(
                  itemCount: OnboaedingModel.onBoardingObjects.length,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _onBoardingController,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        OnboaedingModel.onBoardingObjects[index].image,
                        height: 220.h,
                        fit: BoxFit.cover,
                      ),
                      const VerticalSpacer(space: 24),
                      Text(
                        OnboaedingModel.onBoardingObjects[index].title,
                        textAlign: TextAlign.center,
                        style: applyBoldStyle(
                          fontSize: 16,
                          fontColor: ColorConsatnts.primary,
                        ),
                      ),
                      const VerticalSpacer(space: 10),
                      Text(
                        OnboaedingModel.onBoardingObjects[index].description,
                        textAlign: TextAlign.center,
                        style: applySemiBoldStyle(
                          fontSize: 15,
                          fontColor: ColorConsatnts.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpacer(space: 48),
              SmoothPageIndicator(
                controller: _onBoardingController,
                count: OnboaedingModel.onBoardingObjects.length,
                effect: WormEffect(
                  activeDotColor: ColorConsatnts.primary,
                  type: WormType.thinUnderground,
                  dotWidth: 16,
                  dotHeight: 4,
                  dotColor: ColorConsatnts.grey.withOpacity(0.7),
                ),
              ),
              const VerticalSpacer(space: 36),
              StatefulBuilder(
                builder: (context, rebuild) => AppButton(
                  text: buttonText,
                  onTap: () {
                    _onBoardingController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);

                    if (_onBoardingController.page == 1) {
                      rebuild(
                        () {
                          buttonText = "Start";
                        },
                      );
                    }
                    if (_onBoardingController.page == 2) {
                      rebuild(
                        () {
                          AppConfigCubit.isBoarded = true;
                          SharedPreferencesManager.storeBoolValue(
                              key: StorageConstants.isBoardedKey, value: true);
                          Navigator.pushReplacementNamed(
                              context, RouteConstants.userTypeView);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
