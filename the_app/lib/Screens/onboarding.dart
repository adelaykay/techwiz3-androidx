import 'package:StreamMaster/Screens/signup.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:StreamMaster/screens/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class Onboarding extends StatelessWidget {
  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        onFinish: (){
          Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
        },
        headerBackgroundColor: Colors.transparent,
        finishButtonText: 'Get Started',
        finishButtonStyle: FinishButtonStyle(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: XTheme.of(context).primary,
        ),
        hasSkip: true,
        skipTextButton: Text('Skip', style: XTheme.of(context).bodySmall,),
        centerBackground: true,
        background: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Image.asset(
              'assets/images/onboard1.png',
              width: MediaQuery.of(context).size.width - 20,
            ),
          ),
          Image.asset('assets/images/logo.png'),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Bring your media, and leave the rest to us.',
                  style: XTheme.of(context).title1,
                ),
                Text(
                    'We also have a special fondness for personal media! With StreamMaster, you can effortlessly arrange, enhance, and stream your cherished assortment of films, television series, music, and images, no matter where you are or on which device you\'re using',
                  style: XTheme.of(context).bodyText2,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Looking for entertainment options? We\'ve got you covered.', style: XTheme.of(context).title1,),
                Text('StreamMaster brings together movies and TV shows from your preferred streaming platforms, ensuring there\'s an endless array of content waiting to be explored.', style: XTheme.of(context).bodyText2,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
