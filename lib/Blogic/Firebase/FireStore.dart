import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/Models/User.dart';

import '../../Models/Post.dart';
import '../../Models/Story.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;
 

  static Future<void> AddUserInfo(
      String fullname,
      String username,
      String dateOfBirth,
      String location,
      String phonenumber,
      String userimage,
      bool isOlder16,
      List<Post> posts,
      List<Story> stories) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'fullname': fullname,
      'username': username,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'phonenumber': phonenumber,
      'userimage': userimage,
      'isOlder16': isOlder16,
      'posts': posts,
      'stories': stories,
    });
  }


  static Future<void> AddStory(String username,String userimage,String storyimage,String date,) async {
    await FirebaseFirestore.instance
        .collection('Stories').add({
          'username':username,
          'userimage':userimage,
          'storyimage':storyimage,
          'date':date,
          'userid':auth.currentUser!.uid,
      
    });
  }

   static Future<void> AddPost(String username,String userimage,String postimage,String date,String title) async {
    await FirebaseFirestore.instance
        .collection('posts').add({
          'username':username,
          'userimage':userimage,
          'postimage':postimage,
          'date':date,
          'title':title,
          'userid':auth.currentUser!.uid,
      
    });
  }
 
  // static Future<void> AddPostComment(String postid,String comment,String username,String userimage,String date) async {
  //   await FirebaseFirestore.instance
  //       .collection('posts').doc(postid).collection('comments').add({
  //         'comment':comment,
  //         'username':username,
  //         'userimage':userimage,
  //         'date':date,
  //         'userid':auth.currentUser!.uid,
      
  //   });
  // }
   static Future<void> AddSavedList(String username,String userimage,String postimage,String date,String title) async {
    await FirebaseFirestore.instance
        .collection('Users').doc(auth.currentUser!.uid).collection("saved_list").add({
           'username':username,
          'userimage':userimage,
          'postimage':postimage,
          'date':date,
          'title':title,
          

        });
   }

}
