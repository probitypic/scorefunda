import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scorefunda/controller/signin_controller_provider.dart';
import 'package:scorefunda/views/Widgets/top_bar.dart';
import 'package:scorefunda/views/Widgets/inputfield.dart';
import 'package:scorefunda/views/Widgets/rounded_Button.dart';
import 'package:scorefunda/views/Constants.dart';
import 'package:provider/provider.dart';
import 'package:scorefunda/views/home_screen.dart';
import 'package:scorefunda/views/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String id = "SignInScreen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            TopBar(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign In", style: kTitleStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Don't have an account?", style: kSubTitleStyle),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          });
                        },
                        child: Text("Sign Up",
                            style: kSubTitleStyle.copyWith(
                                color: Color(0xffffD869))),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(children: [
              SizedBox(height: 50),
              Text("Welcome!", style: kTitleStyle.copyWith(color: kTextColor)),
              Text("Let's sign in to begin...",
                  style: kSubTitleStyle.copyWith(color: kTextColor)),
              SizedBox(
                height: 30,
              ),
              InputField(
                  title: "Mobile No",
                  onType: Provider.of<SignInControllerProvider>(context,
                          listen: false)
                      .PhoneNumberController),
              InputField(
                  title: "Password",
                  onType: Provider.of<SignInControllerProvider>(context,
                          listen: false)
                      .PasswordController),
              SizedBox(
                height: 20,
              ),
              RoundedSidedButton(
                onTap: () async {
                  bool logIn = await Provider.of<SignInControllerProvider>(
                          context,
                          listen: false)
                      .UserSignIn();
                  if (logIn) {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                },
                ButtonText: "Continue to Sign In",
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    // Navigator.pushNamed(context, ForgotPassword.id);
                  });
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'QuickSand',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              // Text(
              //   errorMessage,
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontFamily: 'QuickSand',
              //   ),
              // ),
            ]),
          ],
        ),
      ),
    );
    ;
  }
}
