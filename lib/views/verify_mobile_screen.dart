import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scorefunda/controller/verify_mobile_controller_provider.dart';
import 'package:scorefunda/views/Widgets/top_bar.dart';
import 'package:scorefunda/views/Widgets/inputfield.dart';
import 'package:scorefunda/views/Widgets/rounded_Button.dart';
import 'package:scorefunda/views/Constants.dart';
import 'package:provider/provider.dart';
import 'package:scorefunda/controller/signup_controller_provider.dart';

class VerifyMobile extends StatefulWidget {
  const VerifyMobile({super.key});
  static String id = "VerifyMobile";

  @override
  State<VerifyMobile> createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            //----------------top bar ----------------------
            TopBar(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ${Provider.of<SignUpControllerProvider>(context, listen: false).model.userName}",
                    style: kTitleStyle.copyWith(fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Glad to see you",
                    style: kSubTitleStyle,
                  ),
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
              height: 25,
            ),
            InputField(
              title: "Enter OTP",
              onType: Provider.of<VerifyMobileControllerProvider>(context,
                      listen: false)
                  .OtpFieldController,
            ),
            SizedBox(height: 20),
            RoundedSidedButton(onTap: () {}, ButtonText: "Verify Mobile"),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
    ;
  }
}
