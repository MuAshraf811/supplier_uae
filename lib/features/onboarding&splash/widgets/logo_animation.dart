<<<<<<< HEAD
=======
import 'package:supplier_app/core/utils/constants/assets_constants.dart';
>>>>>>> 057b281301ca97393404df537bfcf6817dae9f82
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
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: SizedBox(
        height: 240.w,
        child: LottieBuilder.asset(
          "assets/jsons/Main Scene.json",
          width: 300.w,
          controller: _logoAnimationController,
          frameRate: FrameRate.composition,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
