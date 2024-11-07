// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, annotate_overrides, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/functions/Navigation.dart';

import '../core/utils/text_Styles.dart';
import 'upload_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, UploadScreen());
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/icon_anim.json'),
            Gap(10),
            Text(
              "Taskati",
              style: getTitleStyle(),
            ),
            Gap(20),
            Text("It /'s Time To Get Organised",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
