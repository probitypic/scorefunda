import 'package:flutter/material.dart';
import 'package:scorefunda/controller/signin_controller_provider.dart';
import 'package:scorefunda/controller/signup_controller_provider.dart';
import 'package:scorefunda/controller/verify_mobile_controller_provider.dart';

import 'package:scorefunda/views/home_screen.dart';
import 'package:scorefunda/views/signup_screen.dart';
import 'package:scorefunda/views/splash_screen.dart';
import 'package:scorefunda/views/signIn_screen.dart';
import 'package:provider/provider.dart';
import 'package:scorefunda/views/verify_mobile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInControllerProvider>(
            create: ((context) => SignInControllerProvider())),
        ChangeNotifierProvider<SignUpControllerProvider>(
            create: ((context) => SignUpControllerProvider())),
        ChangeNotifierProvider<VerifyMobileControllerProvider>(
            create: ((context) => VerifyMobileControllerProvider()))
      ],
      child: MaterialApp(
        initialRoute: SignUpScreen.id,
        routes: {
          VerifyMobile.id: ((context) => VerifyMobile()),
          SignUpScreen.id: (context) => SignUpScreen(),
          SplashScreen.id: ((context) => SplashScreen()),
          SignInScreen.id: ((context) => SignInScreen()),
          HomeScreen.id: ((context) => HomeScreen()),
        },
      ),
    );
  }
}
