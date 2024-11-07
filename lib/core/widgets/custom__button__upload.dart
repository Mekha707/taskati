// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_Styles.dart';

class Custom_Button_Upload extends StatelessWidget {
  const Custom_Button_Upload({
    super.key,
    required this.text,
    this.widthBtn,
    this.heightBtn,
    this.bgColor,
    this.color,
    required this.onpressed,
  });

  final String text;
  final double? widthBtn;
  final double? heightBtn;
  final Color? bgColor;
  final Color? color;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBtn ?? 250,
      height: heightBtn ?? 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onpressed,
        child: Text(text,
            style: getTitleStyle(fontsize: 18, color: color ?? AppColor.whiteColor)),
      ),
    );
  }
}
