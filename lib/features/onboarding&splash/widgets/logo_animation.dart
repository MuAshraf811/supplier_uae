import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({
    super.key,
  });

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(vsync: this)
      ..duration = const Duration(seconds: 4)
      ..forward();
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    if (kDebugMode) {
      print("Logo Animation controller has been disposed");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.w,
      child: LottieBuilder.asset(
        AssetsConstants.lottieAnimationLogo,
        width: 300.w,
        controller: _logoAnimationController,
        frameRate: FrameRate.composition,
        fit: BoxFit.cover,
      ),
    );
  }
}
