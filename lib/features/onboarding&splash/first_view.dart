import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> { 
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 7),
      () {
        if(!AppConfigCubit.isBoarded) {
          Navigator.pushNamed(context, RouteConstants.onBoardingView);
        }else if (!AppConfigCubit.isLogged){
          Navigator.pushNamed(context, RouteConstants.userTypeView);
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorConsatnts.white,
          child: LottieBuilder.asset(
            "assets/jsons/Main Scene.json", 
            height: 400.h, 
            width: 300.w, 
            repeat: false, 

          ),
        ),
      ),
    );
  }
}
