import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../client/chat/presentation/widgets/chat_app_bar.dart';

class TermsAndConditionsViewSupplier extends StatelessWidget {
  const TermsAndConditionsViewSupplier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              const VerticalSpacer(space: 16),
              CustomAppbar(title: AppConfigCubit.isEnglish? "TERMS AND CONDITIONS": "الأحكام والشروط"),
              Text(
                AppConfigCubit.isEnglish? "TERMS AND CONDITIONS": "الأحكام والشروط",
                style: applyBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.primary,
                ),
              ),
              Text(
                AppConfigCubit.isEnglish? "Last Updated : [01/12/2024]":"آخر تحديث : [1/12/2024]",
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: Colors.red,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      S.of(context).terms_supplier,
                      style: applyMediumStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
