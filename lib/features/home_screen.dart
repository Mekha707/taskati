// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Services/app_local_storage.dart';
import 'package:taskati/features/addtask.dart';

import '../core/functions/Navigation.dart';
import '../core/utils/color.dart';
import '../core/utils/text_Styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalStorage.getcashData('name'),
                    style: get_title_add_Style(fontsize: 20),
                  ),
                  Text("Have a Nice Day",
                      style: getNormalStyle(
                          fontsize: 15, fontweight: FontWeight.w300)),
                ],
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.orangeColor,
                backgroundImage:  FileImage(File((AppLocalStorage.getcashData('path')))),
              ),
            ],
          ),
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: getNormalStyle(
                  fontweight: FontWeight.w600,
                  color: AppColor.blackColor,
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  pushto(context, AddTask());
                },
                child: Text(
                  "Add Task +",
                  style: getNormalStyle(color: AppColor.whiteColor),
                ))
          ],
        ),
        Gap(15),
        DatePicker(
          width: 80,
          height: 100,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColor.primary,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
          },
        ),
      ]),
    ));
  }
}
