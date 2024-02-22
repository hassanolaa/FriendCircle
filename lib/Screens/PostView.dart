import 'package:flutter/material.dart';
import 'package:social_media_app/Widgets/Post.dart';

import '../Models/Post.dart';

class PostView extends StatefulWidget {
   PostView({super.key,required this.post});
  Post? post;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PostWidget(post: widget.post!)),
    );
  }
}
