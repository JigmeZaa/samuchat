import 'package:flutter/material.dart';
import 'package:samuchat/screens/login_screen.dart';
import 'package:samuchat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:samuchat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  /*
  Documentation
  https://dartlang.org/guides/language/language-tour#keywords
  */

  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// SingleTickerProviderStateMixin provides _welcome to acts as ticker
//  https://pub.dev/packages/animated_text_kit

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
    controller?.forward();

    controller?.addListener(() {
      setState(() {});
      // print(animation?.value);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller!.value),
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    // height: animation?.value * 100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
