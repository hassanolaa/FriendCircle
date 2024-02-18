import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/ProfilePost.dart';
import '../theme/AppColors.dart';

class ProfilePostWidget extends StatefulWidget {
  ProfilePostWidget({
    super.key,
    required this.profile,
  });
  ProfilePost? profile;

  @override
  State<ProfilePostWidget> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePostWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  HomeScreen();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
        child: Image.network(
          widget.profile!.postImg!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
