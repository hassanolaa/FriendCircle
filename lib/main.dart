
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:social_media_app/Screens/HomeScreen.dart';
import 'package:social_media_app/Screens/Navi.dart';


import 'Blogic/Firebase/Auth.dart';
import 'Screens/WelcomeScreen.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
        title: 'Social Media App',
        debugShowCheckedModeBanner: false,
        home:Auth.auth?.currentUser!=null?Navi():WelcomeScreen(),
       // WelcomeScreen(), 
      ),
    );
  }
}


