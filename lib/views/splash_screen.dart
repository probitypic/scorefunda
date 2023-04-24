import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen ";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('images/Splash.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 400,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Your partner for testing skills & ability thorugh online tests and help to grow and earn.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      height: 1.3,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
