import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Blogic/Firebase/FireStore.dart';
import 'package:social_media_app/Models/User.dart';
import 'package:social_media_app/Screens/ProbileScreen.dart';

import '../theme/AppColors.dart';

class EditUserInfo extends StatefulWidget {
  const EditUserInfo({super.key});

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  final auth = FirebaseAuth.instance;

  String? fullname;
  String? username;
  String? dateOfBirth;
  String? location;
  String? phonenumber;
  String? userimage;
  bool? isOlder16;

 

  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
      setState(() {
          fullname = snapshot.data()!['fullname'];
        username = snapshot.data()!['username'];
        dateOfBirth = snapshot.data()!['dateOfBirth'];
        location = snapshot.data()!['location'];
        phonenumber = snapshot.data()!['phonenumber'];
        userimage = snapshot.data()!['userimage'];
        isOlder16 = snapshot.data()!['isOlder16'];
      });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FireStore.GetUserInfo();
    //_loadUserInfo();
    GetUserInfo();
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
          CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage("https://i.imgur.com/zZR7pS9.png"),
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
                child: FastTextField(
                  onChanged: (Value) {
                    setState(() {
                     fullname = Value!;
                    });
                  },
                  name: 'field_destination',
                  decoration: InputDecoration(
                    labelText: fullname,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
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
                labelText: username,
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
                 dateOfBirth = Value.toString();
                });
              },
              name: 'date_picker',
              firstDate: DateTime(1970),
              lastDate: DateTime(2040),
              decoration: InputDecoration(
                labelText: dateOfBirth,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 25.w,
          ),
         Container(
             width: 310.w,
            child: FastTextField(
              onChanged: (Value) {
                setState(() {
                location = Value!;
                });
              },
              name: 'field_destination',
              decoration: InputDecoration(
                labelText: location,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
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
            child: FastTextField(
              onChanged: (Value) {
                setState(() {
                  phonenumber = Value!;
                });
              },
              name: 'field_destination',
              decoration: InputDecoration(
                labelText: phonenumber,
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
                    fullname!,
                    username!,
                   dateOfBirth!,
                    location!,
                     phonenumber!,
                    "https://i.imgur.com/zZR7pS9.png",
                    true, [], []);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen()));
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
                    "Save",
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
        ]
      ),
    )
    );
  }
}
