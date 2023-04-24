import 'package:flutter/material.dart';
import 'package:scorefunda/controller/signin_controller_provider.dart';
import 'package:scorefunda/views/home_screen.dart';
import 'package:scorefunda/views/splash_screen.dart';
import 'package:scorefunda/views/signIn_screen.dart';
import 'package:provider/provider.dart';

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
            create: ((context) => SignInControllerProvider()))
      ],
      child: MaterialApp(
        initialRoute: SignInScreen.id,
        routes: {
          SplashScreen.id: ((context) => SplashScreen()),
          SignInScreen.id: ((context) => SignInScreen()),
          HomeScreen.id: ((context) => HomeScreen()),
        },
      ),
    );
  }
}
