// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, body_might_complete_normally_nullable, use_build_context_synchronously, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/Navigation.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_Styles.dart';
import 'package:taskati/features/home_screen.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();

  var noteController = TextEditingController();

  var dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));

  var startTimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));

  var endTimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));

  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
            onPressed: () {
              pushto(context, HomeScreen());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            )),
        title:
            Text("Add Task", style: getNormalStyle(color: AppColor.whiteColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Title",
                style: getNormalStyle(),
              ),
              Gap(5),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter title';
                  }
                },
              ),
              Gap(10),

              // Note
              Text(
                "Note",
                style: getNormalStyle(),
              ),
              Gap(5),
              TextFormField(
                maxLines: 5,
                controller: noteController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Note';
                  }
                },
              ),
              Gap(10),

              // Date
              Text(
                "Date",
                style: getNormalStyle(),
              ),
              Gap(5),
              TextFormField(
                controller: dateController,
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030))
                      .then((value) {
                    if (value != null) {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(value);
                    }
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.date_range_rounded,
                    color: AppColor.primary,
                  ),
                ),
              ),
              Gap(10),

              // Start and End
              Row(
                children: [
                  Expanded(
                      // Start
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: getNormalStyle(),
                      ),
                      Gap(5),
                      TextFormField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              startTimeController.text = value.format(context);
                            }
                          });
                        },
                        readOnly: true,
                        controller: startTimeController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.access_time_rounded,
                            color: AppColor.primary,
                          ),
                        ),
                      )
                    ],
                  )),
                  Gap(10),
                  Expanded(
                      // End
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End Time",
                        style: getNormalStyle(),
                      ),
                      Gap(5),
                      TextFormField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              startTimeController.text = value.format(context);
                            }
                          });
                        },
                        readOnly: true,
                        controller: endTimeController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.access_time_rounded,
                            color: AppColor.primary,
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
              Gap(20),

              // Colors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("Color", style: getNormalStyle()),
                  Row(
                      children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: index == 0
                              ? AppColor.primary
                              : index == 1
                                  ? AppColor.orangeColor
                                  : AppColor.redColor,
                          child: (selectedColor == index)
                              ? Icon(
                                  Icons.check,
                                  color: AppColor.whiteColor,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    );
                  })),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      child: Text(
                        "Creat Task",
                        style: getNormalStyle(
                            fontsize: 18, color: AppColor.whiteColor),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
