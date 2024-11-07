// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/utils/text_Styles.dart';
import 'package:taskati/features/addtask.dart';
import 'package:taskati/features/home_screen.dart';
import 'package:taskati/features/upload_screen.dart';

import 'core/Services/app_local_storage.dart';
import 'core/utils/color.dart';
import 'features/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox('user');
    await AppLocalStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: themewidget(),
      // home: SplashScreen(),
    );
  }

  ThemeData themewidget() {
    return ThemeData(
        // appBarTheme: AppBarTheme(backgroundColor: AppColor.orangeColor),
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: getNormalStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor),
          borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor),
          borderRadius: BorderRadius.circular(10)),
    ));
  }
}
