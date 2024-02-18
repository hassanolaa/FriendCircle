import 'package:flutter/material.dart';
import 'package:social_media_app/Models/StoryInfo.dart';

import '../Widgets/StoryInfo.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StoryInfoWidget(storyInfo: StoryInfo( username:"hassan", userImg:"https://i.imgur.com/zZR7pS9.png", storyImg:"https://i.imgur.com/zZR7pS9.png",date: "2024-02-24",),),
    );
  }
}