import 'package:StreamMaster/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:StreamMaster/screens/login.dart';
import 'firebase_options.dart';
import 'screens/onboarding.dart';
import 'package:StreamMaster/screens/register.dart';
import 'package:StreamMaster/Screens/contactus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      darkTheme: isDarkMode ? ThemeData.dark() : null,
      themeMode: XTheme.themeMode,
      home: ContactUs() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
