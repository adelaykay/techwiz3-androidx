import 'package:StreamMaster/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:StreamMaster/screens/login.dart';
import 'firebase_options.dart';
<<<<<<< HEAD
import 'onboarding.dart';

=======
import 'package:the_app/Screens/register.dart';
>>>>>>> 30edd2b1eaf4de343c3ace282054298b40db869b
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
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
