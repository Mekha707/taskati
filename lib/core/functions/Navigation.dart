import 'package:flutter/material.dart';

  pushto(BuildContext context, Widget newScreen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return newScreen;
    }));
  }

  pushReplacement(BuildContext context, Widget newScreen) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return newScreen;
    }));
  }
