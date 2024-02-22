

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/Blogic/Firebase/Auth.dart';

import '../Models/Post.dart';
import '../Widgets/Post.dart';

class SavedList extends StatefulWidget {
  const SavedList({super.key});

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Users').doc(Auth.auth.currentUser!.uid).collection("saved_list").snapshots(),
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
            ),
      ) ,
    );
  }
}