import 'package:flutter/material.dart';
import 'package:scorefunda/views/sign_in_screen.dart';
import 'package:scorefunda/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SignInScreen.id: ((context) => SignInScreen()),
        SplashScreen.id: ((context) => SplashScreen()),
      },
    );
  }
}
