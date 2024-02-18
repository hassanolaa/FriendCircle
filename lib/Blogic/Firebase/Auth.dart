

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{

static  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in with email and password
static  Future signInWithEmailAndPassword(String email, String password) async {
    try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
       
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


   // sign up with email and password
static  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
        await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


static Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
} 

  static SignOut()async{
    await auth.signOut();
  }
  // // register with email and password
  // Future registerWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     User user = result.user;
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // sign out
  // Future signOut() async {
  //   try {
  //     return await _auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // // reset password
  // Future resetPassword(String email) async {
  //   try {
  //     return await _auth.sendPasswordResetEmail(email: email);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
 // }

  // // get current user
  // Future getCurrentUser() async {
  //   try {
  //     return await _auth.currentUser;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
 // }








}