
import 'Post.dart';
import 'Story.dart';

class UserModel {
  String? fullname;
  String? username;
  String? dateOfBirth;
  String? location;
  String? phonenumber;
  String? userimage;
  bool? isOlder16;
  List<Post>? posts;
  List<Story>? stories;

  UserModel(
      {this.fullname,
      this.username,
      this.dateOfBirth,
      this.location,
      this.phonenumber,
      this.userimage,
      this.isOlder16,
      this.posts,
      this.stories});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json['fullname'],
      username: json['username'],
      dateOfBirth: json['dateOfBirth'],
      location: json['location'],
      phonenumber: json['phonenumber'],
      userimage: json['userimage'],
      isOlder16: json['isOlder16'],
      posts: json['posts'],
      stories: json['stories'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'username': username,
        'dateOfBirth': dateOfBirth,
        'location': location,
        'phonenumber': phonenumber,
        'userimage': userimage,
        'isOlder16': isOlder16,
        'posts': posts,
        'stories': stories,
      };
}
