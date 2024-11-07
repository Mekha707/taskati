// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/functions/Navigation.dart';
import 'package:taskati/features/home_screen.dart';
import '../core/Services/app_local_storage.dart';
import '../core/functions/showdialog.dart';
import '../core/utils/color.dart';
import '../core/utils/text_Styles.dart';
import '../core/widgets/custom__button__upload.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // This widget is the root of your application.
  String? name;
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (name == ' ' && path == " ") {
                  showSnakeDialog(context, "Please Enter Your Name");
                } else if (name != " " && path == " ") {
                  showSnakeDialog(context, "Please Enter an image");
                } else if (name == " " && path != " ") {
                  showSnakeDialog(context, "Please Enter Your Name");
                } else {
                  AppLocalStorage.cashData('name', name);
                  AppLocalStorage.cashData('path', path);
                  AppLocalStorage.cashData('isUpload', true);
                  pushto(context, HomeScreen());
                }
                pushto(context, HomeScreen());
              },
              child: Text(
                "Done",
                style: getTitleStyle(fontsize: 20, color: AppColor.primary),
              ))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: path != null
                ? AssetImage('path')
                : AssetImage("assets/images/th.jpg"),
          ),
          Gap(25),
          Custom_Button_Upload(
            text: "Upload From Camera",
            onpressed: uploadImage(isCamera: false),
          ),
          Gap(10),
          Custom_Button_Upload(
            text: "Upload From Gallarey",
            onpressed: uploadImage(isCamera: true),
          ),
          Gap(30),
          Divider(color: AppColor.primary, indent: 20, endIndent: 20),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Enter Your Name", hintStyle: getNormalStyle()),
              ),
            ),
          )
        ]),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
