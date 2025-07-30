import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/service_locator.dart';

class DropDownWithTextField extends StatelessWidget {
  const DropDownWithTextField({super.key , this.onchanged});
 final void Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged:onchanged?? (value) { 
        ServiceLocator.getIt<AuthenticationCubit>().citySelection = value as String? ??'Abu Dhabi';  
                ServiceLocator.getIt<AuthenticationCubit>().profileCitySelection = value ??'Abu Dhabi'; 


      },
      borderRadius: BorderRadius.circular(12.r),
      dropdownColor: ColorConsatnts.white,
      iconEnabledColor: ColorConsatnts.primary,
      iconSize: 24.w,
      menuMaxHeight: 400.h,
      isExpanded: false,
      isDense: true,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 36.h),
          contentPadding: EdgeInsets.only(left: 16.w, right: 18.w),
          labelStyle:
              applyMediumStyle(fontSize: 14, fontColor: ColorConsatnts.black),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: 0.5.h,
                color: ColorConsatnts.lightBlack,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: 0.5.h,
                color: ColorConsatnts.lightBlack,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: 1.h,
                color: ColorConsatnts.lightBlack,
              )),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorConsatnts.primary, width: 0.5),
            borderRadius: BorderRadius.circular(12.r),
          )),
      value: AppConst.uaeCities[1],
      items: AppConst.uaeCities
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: applyMediumStyle(
                  fontSize: 15,
                  fontColor: ColorConsatnts.black,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
