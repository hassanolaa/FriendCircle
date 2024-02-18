


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/theme/AppColors.dart';

import '../Blogic/Firebase/Auth.dart';
import 'Navi.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.secondaryColor,
                )),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            Text(
              "Sign In",
              style: GoogleFonts.bebasNeue(
                  color: AppColors.secondaryColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter Your Email",
              labelText: 'Email',
              labelStyle: TextStyle(color: AppColors.secondaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.secondaryColor),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.secondaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Your Password",
              labelText: 'Password',
              labelStyle: TextStyle(color: AppColors.secondaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.secondaryColor),
              ),
              prefixIcon: Icon(
                Icons.password,
                color: AppColors.secondaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
              Auth.signInWithEmailAndPassword(_emailController.text, _passwordController.text);

                Navigator.push(context,  MaterialPageRoute(        builder: (context) =>Navi()));
              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
                Auth.signInWithGoogle();
                Navigator.push(context,  MaterialPageRoute(        builder: (context) =>Navi()));

              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                  "SignIn With Google",
                  style: TextStyle(
                      color: AppColors.secondaryColor, fontSize: 20.sp),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.secondaryColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 35.w,
            ),
            Text(
              "Not Have An Account Yet?",
              style:
                  TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: AppColors.quaternaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ]),
    );
  }
}
