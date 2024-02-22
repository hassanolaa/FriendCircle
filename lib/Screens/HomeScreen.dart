import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Blogic/Firebase/FireStore.dart';
import 'package:social_media_app/Models/Post.dart';
import 'package:social_media_app/Models/Story.dart';
import 'package:social_media_app/Screens/NewPost.dart';
import 'package:social_media_app/Screens/NewStory.dart';
import 'package:social_media_app/Screens/WelcomeScreen.dart';
import 'package:social_media_app/Widgets/Post.dart';
import 'package:social_media_app/Widgets/Story.dart';
import 'package:social_media_app/theme/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  String? fullname = "";
  String? username = "";
  String? dateOfBirth = "";
  String? location = "";
  String? phonenumber = "";
  String? userimage = "";
  bool? isOlder16 = true;

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
    print(auth.currentUser!.uid);
    print("State");
    GetUserInfo();
    print("State2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),
              CircleAvatar(
                radius: 25.r,
                //backgroundColor: AppColors.primaryColor,
                backgroundImage: NetworkImage(userimage!),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Hello, \n$username!',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40.w,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 25,
                  )),
                    IconButton(
                  onPressed: () {
                    FireStore.auth.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 25,
                  )),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
              height: 120,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Stories')
                    .snapshots(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snap.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: StoryWidget(
                            story: Story(
                                username: snap.data!.docs[index]['username'],
                                userIm: snap.data!.docs[index]['userimage'],
                                storyImg: snap.data!.docs[index]['storyimage'],),
                          ),
                        );
                      },
                    );
                  }
                },
              )),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewPost(
                                username: username,
                                userimage: userimage,
                              )));
                },
                child: Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.backgroundColor,
                        border: Border.all(
                            width: 3.w, color: AppColors.primaryColor)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(Icons.add,
                            size: 20, color: AppColors.primaryColor),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Post',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  try {
                    FireStore.AddStory(
                        "hassan",
                        "https://i.imgur.com/zZR7pS9.png",
                        "https://i.imgur.com/zZR7pS9.png",
                        "2:30");
                  } catch (e) {
                    print(e);
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewStory(
                                username: username!, userimage: userimage!)));
                  },
                  child: Container(
                      width: 100.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.backgroundColor,
                          border: Border.all(
                              width: 3.w, color: AppColors.quaternaryColor)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(Icons.image,
                              size: 20, color: AppColors.quaternaryColor),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Story',
                            style: TextStyle(
                                color: AppColors.quaternaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snap.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snap.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PostWidget(
                        post: Post(
                          username: snap.data!.docs[index]['username'],
                          userImg: snap.data!.docs[index]['userimage'],
                          postImg: snap.data!.docs[index]['postimage'],
                          title: snap.data!.docs[index]['title'],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )

              // Post("hassan",'https://i.imgur.com/zZR7pS9.png', 'https://i.imgur.com/zZR7pS9.png')
              )
        ],
      )),
    );
  }
}
