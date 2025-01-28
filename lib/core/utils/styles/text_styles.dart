import 'package:supplier/core/utils/constants/font_family_constants.dart';
import 'package:flutter/material.dart';

TextStyle applyRegularStyle({
  required double fontSize,
  required Color fontColor,
  String fontFamily = FontFamilyConstants.quickSand,
}) {
  return TextStyle(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    fontSize: fontSize,
    // overflow: TextOverflow.ellipsis
  );
}

TextStyle applyMediumStyle({
  required double fontSize,
  required Color fontColor,
  String fontFamily = FontFamilyConstants.quickSand,
}) {
  return TextStyle(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: fontSize,
    // overflow: TextOverflow.ellipsis
  );
}

TextStyle applySemiBoldStyle({
  required double fontSize,
  required Color fontColor,
  String fontFamily = FontFamilyConstants.quickSand,
}) {
  return TextStyle(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    fontSize: fontSize,
    // overflow: TextOverflow.ellipsis
  );
}

TextStyle applyBoldStyle({
  required double fontSize,
  required Color fontColor,
  String fontFamily = FontFamilyConstants.quickSand,
}) {
  return TextStyle(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontSize: fontSize,
    // overflow: TextOverflow.ellipsis
  );
}
