import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Models/StoryInfo.dart';

import '../theme/AppColors.dart';

class StoryInfoWidget extends StatefulWidget {
  StoryInfoWidget({
    super.key,
    required this.storyInfo,
  });
  StoryInfo? storyInfo;

  @override
  State<StoryInfoWidget> createState() => _StoryInfoState();
}

class _StoryInfoState extends State<StoryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: NetworkImage(widget.storyInfo!.storyImg!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(width: 30.w),
                CircleAvatar(
                    radius: 22.r,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: NetworkImage(widget.storyInfo!.userImg!),
                    )),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Text(
                      widget.storyInfo!.username!,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      widget.storyInfo!.date!,
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
          ],
        ));
  }
}
