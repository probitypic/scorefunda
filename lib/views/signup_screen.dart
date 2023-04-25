import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scorefunda/controller/signup_controller_provider.dart';
import 'package:scorefunda/views/Constants.dart';
import 'package:scorefunda/views/Widgets/top_bar.dart';
import 'package:scorefunda/views/Widgets/inputfield.dart';
import 'package:scorefunda/views/Widgets/rounded_Button.dart';
import 'package:provider/provider.dart';
import 'package:scorefunda/views/signIn_screen.dart';
import 'package:scorefunda/views/verify_mobile_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = "SignUpScreen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  Text("Sign Up", style: kTitleStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Already have an account?", style: kSubTitleStyle),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Sign In",
                          style:
                              kSubTitleStyle.copyWith(color: Color(0xffffb800)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Welcome!", style: kTitleStyle.copyWith(color: kTextColor)),
            Text("Let's sign up to begin...",
                style: kSubTitleStyle.copyWith(color: kTextColor)),
            SizedBox(
              height: 20,
            ),
            InputField(
              title: "Full Name",
              onType:
                  Provider.of<SignUpControllerProvider>(context, listen: false)
                      .UserNameController,
            ),
            InputField(
              title: "Mobile No",
              onType:
                  Provider.of<SignUpControllerProvider>(context, listen: false)
                      .MobileNumberController,
            ),
            InputField(
              title: "Password",
              onType:
                  Provider.of<SignUpControllerProvider>(context, listen: false)
                      .PasswordController,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedSidedButton(
              onTap: () async {
                bool Status = await Provider.of<SignUpControllerProvider>(
                        context,
                        listen: false)
                    .UserSignUp();
                if (Status == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VerifyMobile(
                              PhoneNumber:
                                  Provider.of<SignUpControllerProvider>(context,
                                          listen: false)
                                      .model
                                      .mobileNo))));
                }
              },
              ButtonText: "Continue to Sign Up",
            ),
            SizedBox(height: 10),
            Text(
              Provider.of<SignUpControllerProvider>(context, listen: false)
                  .model
                  .error,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
