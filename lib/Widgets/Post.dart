import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Models/Post.dart';

import '../theme/AppColors.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
    super.key,
    required this.post,
  });
  Post? post;

  @override
  State<PostWidget> createState() => _PostState();
}

class _PostState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 2.w, color: AppColors.primaryColor),
      ),
      child: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.primaryColor,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(widget.post!.userImg!),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              '${widget.post!.username!}\n',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            SizedBox(
              width: 130.w,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_outline,
                  size: 25,
                  color: AppColors.primaryColor,
                )),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              "jcdbjkcvdjkvndjkvnkdjvnkdvknd",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 300.w,
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(widget.post!.postImg!),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: AppColors.primaryColor,
                )),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment,
                  size: 25,
                  color: AppColors.primaryColor,
                )),
            SizedBox(
              width: 130.w,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  size: 25,
                  color: AppColors.primaryColor,
                )),
          ],
        ),
      ]),
    );
  }
}
