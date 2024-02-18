import 'dart:io';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/Blogic/Firebase/FireStore.dart';

import '../theme/AppColors.dart';

class NewPost extends StatefulWidget {
   NewPost({super.key,required this.username,required this.userimage});
  String? username;
  String? userimage;


  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool getimage = false;
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
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(width: 30.w),
              CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundImage:
                        NetworkImage(widget.userimage!),
                  )),
              SizedBox(width: 10.w),
              Column(
                children: [
                  Text(
                    widget.username!,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "public",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 160.w),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          TextField(
            controller: title,
            decoration: InputDecoration(
              hintText: "What's on your mind?",
              hintStyle: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15.sp,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // enterpassword? true:false
          // enterpassword? home:reload

          getimage
              ? Container(
                  width: MediaQuery.sizeOf(context).width / 0.8,
                  height: 350.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(file!),
                      //    image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      SmartDialog.show(builder: (context) {
                        return upload_way();
                      });
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 0.8,
                    height: 350.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.w,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Icon(Icons.image,
                              size: 40, color: AppColors.primaryColor),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () async {
              await FireStore.AddPost(widget.username!,
                  widget.userimage!, url, "date",title.text );
            },
            child: Container(
              width: 100.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
