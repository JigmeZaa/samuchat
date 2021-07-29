import 'package:flutter/material.dart';
import 'package:samuchat/screens/welcome_screen.dart';
import 'package:samuchat/screens/login_screen.dart';
import 'package:samuchat/screens/registration_screen.dart';
import 'package:samuchat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      Documentation:
      https://flutter.dev/doc/cookbook/nagigation/named-routes
      */
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
