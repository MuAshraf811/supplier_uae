import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/snack_bar.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
=======
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/service_locator.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
>>>>>>> 057b281301ca97393404df537bfcf6817dae9f82
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';

import '../../../features/client/chat/presentation/cubit/chat_cubit.dart';
import '../../../generated/l10n.dart';

showTermsAndConditionsDialog(
    BuildContext context,
    bool isSeller,
    {String? offerSupplierId, String? offerId, String? orderId, String? supplierName}
    ) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) => Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorConsatnts.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: ListView(
          children: [
            Text(
              AppConfigCubit.isEnglish? "By Signing In , You agree to Our Terms & Conditions Which is : ": "انا اوافق علي الشروط والاحكام الاتيه:",
              style: applyBoldStyle(
                fontSize: 16,
                fontColor: ColorConsatnts.primary,
              ),
            ),
            const VerticalSpacer(space: 12),
            Text(
              isSeller
                  ? S.of(context).terms_supplier
                  : S.of(context).terms_client,
              style: applySemiBoldStyle(
                fontSize: 16,
                fontColor: ColorConsatnts.black,
              ),
            ),
            const VerticalSpacer(space: 16),
            BlocProvider(
              create: (context) => ServiceLocator.getIt<ChatCubit>(),
              child:  AppButton(
                    text: S.of(context).accept,
                    onTap: () async {
                      if(offerSupplierId != null){

                       final response = await ServiceLocator.getIt<AuthenticationCubit>()
                           .approveOffer(offerId, orderId, offerSupplierId);
                       showCustomSnackBar(context,
                           response,
                           response=="Congrats! Now, wait for admin to contact you"?
                           Colors.green: Colors.red
                       );
                      }
                      showCustomSnackBar(context,
                          "Congrats!",
                          Colors.green
                      );
                      Navigator.pushReplacementNamed(
                          context,
                          isSeller
                              ? RouteConstants.logInView
                              : RouteConstants.homePage);
                    }),
            )
          ],
        ),
      ),
    ),
  );
}
