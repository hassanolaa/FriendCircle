import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/Blogic/Firebase/FireStore.dart';
import 'package:social_media_app/Screens/Navi.dart';
import 'package:social_media_app/theme/AppColors.dart';
import 'package:path/path.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool getimage = false;

  String firstname = "";
  String lastname = "";
  String username = "";
  String dateofbirth = "";
  String country = "";
  String city = "";
  String code = "";
  String phonenumber = "";
  bool isOlder16 = false;
    File? file;
  TextEditingController title = TextEditingController();
  String url = "hassan";

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image!.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image!.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  Widget upload_way() {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2.w,
        ),
      ),
      child: Center(
          child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () async {
              await UploadImage_gallery();
            },
            child: Container(
              height: 100.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Icon(Icons.image, size: 40, color: AppColors.backgroundColor),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Add from gallery',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () async {
              await UploadImage_camera();
            },
            child: Container(
              height: 100.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Icon(Icons.camera,
                      size: 40, color: AppColors.backgroundColor),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Add from Camera',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          getimage?GestureDetector(
            onTap: () {
             
            },
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage:FileImage(file!),
            ),
          ):
          GestureDetector(
            onTap: () {
              setState(() {
                SmartDialog.show(builder: (context) {
                        return upload_way();
                      });
                    
              });
            },
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage:NetworkImage("https://i.imgur.com/zZR7pS9.png"),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 150.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      firstname = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 150.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      lastname = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 310.w,
            child: FastTextField(
              onChanged: (Value) {
                setState(() {
                  username = Value!;
                });
              },
              name: 'field_destination',
              decoration: InputDecoration(
                labelText: 'User name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 310.w,
            height: 60.h,
            child: FastDatePicker(
              onChanged: (Value) {
                setState(() {
                  dateofbirth = Value.toString();
                });
              },
              name: 'date_picker',
              firstDate: DateTime(1970),
              lastDate: DateTime(2040),
              decoration: InputDecoration(
                labelText: 'Date of birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 150.w,
                child: FastDropdown<String>(
                  onChanged: (Value) {
                    setState(() {
                      country = Value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  name: 'dropdown',
                  items: ['Egypt', 'Irac', 'Usa', 'England', 'Iceland'],
                  initialValue: 'Egypt',
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 150.w,
                child: FastDropdown<String>(
                  onChanged: (Value) {
                    setState(() {
                      city = Value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  name: 'dropdown',
                  items: ['Cairo', 'Baghdad', 'NewYork', 'London', 'Iceland'],
                  initialValue: 'Cairo',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 70.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      code = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 230.w,
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                      phonenumber = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                width: 310.w,
                height: 80.h,
                child: FastSwitch(
                  onChanged: (Value) {
                    setState(() {
                      isOlder16 = Value!;
                    });
                  },
                  name: 'switch',
                  titleText: 'Are You older than 16 ?',
                  contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 80.w,
              ),
              GestureDetector(
                onTap: () {
                  try {
                   FireStore.AddUserInfo(
                        firstname + " " + lastname,
                        username,
                        dateofbirth,
                        country + " " + city,
                        code + " " + phonenumber,
                        url,
                        isOlder16,
                        [],
                        []);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navi()));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                    width: 200.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.primaryColor),
                    child: Center(
                      child: Text(
                        "Join Our Family",
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ]),
      ),
    );
  }
}
