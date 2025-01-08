import 'package:supplier/core/utils/widgets/custom_app_bar.dart';
import 'package:supplier/features/supplier/Authentication/presentation/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/widgets/spacers.dart';

class SupplierRegisterView extends StatelessWidget {
  const SupplierRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: const Column(
            children: [
              VerticalSpacer(space: 24),
              GeneralAppBar(title: "Supplier Register Page", isBackArrowShown: false,),
              VerticalSpacer(space: 26),
              Expanded(
                child: RegisterStepper(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
