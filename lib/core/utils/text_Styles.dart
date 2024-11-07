// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:taskati/core/constants.dart/App_Fonts.dart';
import 'package:taskati/core/utils/color.dart';

TextStyle getTitleStyle(
    {double? fontsize, FontWeight? fontweight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 40,
    fontFamily: AppFont.poppins,
    fontWeight: FontWeight.w500,
    color: color ?? AppColor.blackColor,
  );
}

TextStyle get_title_add_Style(
    {double? fontsize, FontWeight? fontweight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 25,
    fontFamily: AppFont.poppins,
    fontWeight: FontWeight.w700,
    color: color ?? AppColor.primary,
  );
}

TextStyle getNormalStyle(
    {double? fontsize, FontWeight? fontweight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 20,
    fontFamily: AppFont.poppins,
    color: color ?? AppColor.blackColor,
    fontWeight: fontweight ?? FontWeight.w700,
  );
}
