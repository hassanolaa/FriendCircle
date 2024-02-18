import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Blogic/Firebase/FireStore.dart';
import 'package:social_media_app/Models/Story.dart';
import 'package:social_media_app/Widgets/ProfilePost.dart';
import 'package:social_media_app/Widgets/Story.dart';
import 'package:social_media_app/theme/AppColors.dart';

import '../Blogic/Firebase/Auth.dart';
import '../Models/ProfilePost.dart';
import 'EditUserInfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.red,
                //  image: DecorationImage(
                //    image: NetworkImage('https://i.imgur.com/zZR7pS9.png'),
                //    fit: BoxFit.cover,),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage('https://i.imgur.com/zZR7pS9.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '@JohnDoedhsk',
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditUserInfo()));
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 20.dg,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  children: [
                    Text(
                      'Posts',
                      style: TextStyle(
                          fontSize: 15.sp, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '30',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                          fontSize: 15.sp, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '120',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                          fontSize: 15.sp, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '200',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 190.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                        child: Text(
                      'Follow',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.backgroundColor,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 60.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2.w),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.chat_bubble_outline,
                      size: 20.dg,
                      color: AppColors.primaryColor,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  'Stories',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 160.w,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu))
              ],
            ),
            Container(
                height: 160.h,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('stories')
                      .snapshots(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: StoryWidget(
                            story: Story(
                                username: "hassan",
                                userIm: "https://i.imgur.com/zZR7pS9.png",
                                storyImg: "https://i.imgur.com/zZR7pS9.png"),
                          ),
                        );
                      },
                    );
                  },
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  'Posts',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 160.w,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu))
              ],
            ),
            Container(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return CircularProgressIndicator();
                }
                return GridView.builder(
                  itemCount: snap.data!.docs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    if (snap.data!.docs[index]['userid'] ==
                        Auth.auth.currentUser!.uid) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProfilePostWidget(
                            profile: ProfilePost(
                              postImg: snap.data!.docs[index]['postimage'],
                            ),
                          ));
                    } else {
                      return SizedBox(
                        width: 0,
                        height: 0,
                      );
                    }
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
