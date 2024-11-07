import 'package:flutter/material.dart';
import 'package:taskati/core/utils/text_Styles.dart';

import '../utils/color.dart';

showSnakeDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.redColor,
      content: Text(message, style: getNormalStyle())));
}

