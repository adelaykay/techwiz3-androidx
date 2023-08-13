import 'package:StreamMaster/screens/contactus.dart';
import 'package:StreamMaster/screens/favorites.dart';
import 'package:StreamMaster/screens/feedback.dart';
import 'package:StreamMaster/screens/forgot_password.dart';
import 'package:StreamMaster/screens/home.dart';
import 'package:StreamMaster/screens/media_details.dart';
import 'package:StreamMaster/screens/search_results.dart';
import 'package:StreamMaster/screens/signup.dart';
import 'package:StreamMaster/screens/subscription.dart';
import 'package:StreamMaster/screens/update_profile.dart';
import 'package:StreamMaster/screens/videos_list.dart';
import 'package:StreamMaster/screens/videos_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:StreamMaster/screens/signin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'firebase_options.dart';
import 'models/screen_arguments.dart';
import 'screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    var routeName = '/onboarding';
    return MaterialApp(
      darkTheme: isDarkMode ? ThemeData.dark() : null,
      themeMode: XTheme.themeMode,
      initialRoute: user != null ? Home.routeName : Onboarding.routeName,
      // initialRoute: user != null ? Home.routeName : Onboarding.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SearchResultsPage.routeName: (context) => SearchResultsPage(),
        FavoritesPage.routeName: (context) => FavoritesPage(),
        SignupScreen.routeName: (context) => SigninScreen(),
        Onboarding.routeName: (context) => Onboarding(),
        SigninScreen.routeName: (context) => SigninScreen(),
        FeedBackForm.routeName: (context) => FeedBackForm(),
        ContactUs.routeName: (context) => ContactUs(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        MySubs.routeName: (context) => MySubs(),
        UpdateProfileScreen.routeName: (context) => UpdateProfileScreen()
      },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == MediaDetailsPage.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return MediaDetailsPage(
                id: args.id,
                mediaType: args.mediaType,
                backdrop: args.backdrop,
              );
            },
          );
        }
        if (settings.name == VideosPage.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as Map;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              // print('main${args['videosList']}');
              return VideosPage(videosList: args['videosList']);
            },
          );
        }
        if (settings.name == VideoList.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as Map;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              // print('main${args['videosList']}');
              return VideoList(videosList: args['videosList']);
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
