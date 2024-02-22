import 'package:flutter/material.dart';
import 'package:social_media_app/Models/StoryInfo.dart';

import '../Widgets/StoryInfo.dart';

class StoryView extends StatefulWidget {
   StoryView({super.key,    required this.storyInfo,});
 StoryInfo? storyInfo;
  @override
  State<StoryView> createState() => _testState();
}

class _testState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StoryInfoWidget(storyInfo: StoryInfo( username:widget.storyInfo!.username, userImg:widget.storyInfo!.userImg, storyImg:widget.storyInfo!.storyImg,date: "2024-02-24",),),
    );
  }
}