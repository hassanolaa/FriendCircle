import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Screens/HomeScreen.dart';
import 'package:social_media_app/Screens/ProbileScreen.dart';
import 'package:social_media_app/theme/AppColors.dart';

import '../Models/Story.dart';

class StoryWidget extends StatefulWidget {
  StoryWidget({
    super.key,
    required this.story,
  });
  Story? story;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.w,
        height: 110.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: NetworkImage(widget.story!.storyImg!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 10.r,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundImage: NetworkImage(widget.story!.userIm!),
                    )),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.story!.username!,
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
}
