import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.suffixIcon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.type,
    this.maxLines,
    this.minLines,
    this.maxHeight,
    this.suffixColor,
    this.suffixSize, 
    this.suffixSvg , 
    this.readOnly,   
    this.isSecured,
    
  });
  final String label; 
  final bool? readOnly;
  final IconData suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? type;
  final int? maxLines;
  final int? minLines;
  final double? maxHeight;
  final double? suffixSize;
  final  Widget? suffixSvg;
  final Color? suffixColor;  
  final bool? isSecured;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: type,
      maxLines: maxLines,
      minLines: minLines, 
      obscureText: isSecured?? false,
      autocorrect: true, 
      readOnly: readOnly?? false,
      scribbleEnabled: true,
      style: applySemiBoldStyle(
        fontSize: 16,
        fontColor: ColorConsatnts.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 10.h, left: 8.w),
        // constraints:
        //     BoxConstraints(maxHeight: maxHeight ?? 48.h, minHeight: 36.h),
        errorStyle: applyRegularStyle(fontSize: 14, fontColor: Colors.red),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child:   suffixSvg??  Icon(
            suffixIcon,
            size: suffixSize ?? 24,
            color: suffixColor ?? ColorConsatnts.primary,
          ),
        ),
        label: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            label,
            style: applyMediumStyle(
              fontSize: 14,
              fontColor: ColorConsatnts.grey,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: ColorConsatnts.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 146, 23, 14),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: ColorConsatnts.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: ColorConsatnts.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: ColorConsatnts.primary,
          ),
        ),
      ),
    );
  }
}
