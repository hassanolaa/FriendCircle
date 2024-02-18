
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Screens/SignUp.dart';
import 'package:social_media_app/theme/AppColors.dart';

import 'SignIn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Image(image: AssetImage("images/icon.png")),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 60.w,
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(color: AppColors.backgroundColor, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.backgroundColor)),
              ),
            ).animate().fade(duration: 2.seconds),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()));

              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: AppColors.backgroundColor, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.backgroundColor)),
              ),
            ).animate().fade(duration: 2.seconds),
          ],
        )
    
      
      ]),
    );
  }
}

