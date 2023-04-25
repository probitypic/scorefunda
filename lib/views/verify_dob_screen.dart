import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scorefunda/controller/signup_controller_provider.dart';
import 'package:scorefunda/controller/verify_dob_controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:scorefunda/controller/verify_mobile_controller_provider.dart';
import 'package:scorefunda/views/home_screen.dart';
import 'Constants.dart';
import 'Widgets/inputfield.dart';
import 'Widgets/rounded_Button.dart';
import 'Widgets/top_bar.dart';

class VerifyDobScreen extends StatefulWidget {
  const VerifyDobScreen({super.key});
  static String id = "VerifyDobScreen";
  @override
  State<VerifyDobScreen> createState() => _VerifyDobScreenState();
}

class _VerifyDobScreenState extends State<VerifyDobScreen> {
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
                  Text(
                    "Welcome ${Provider.of<SignUpControllerProvider>(context, listen: false).getUserName()},",
                    style: kTitleStyle,
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
            Text("Let us know you",
                style: kTitleStyle.copyWith(color: kTextColor)),
            Text("to suggest matching tests new passowrd",
                style: kSubTitleStyle.copyWith(color: kTextColor)),
            SizedBox(
              height: 25,
            ),
            InputField(
              title: "Date of Birth",
              onType: Provider.of<VerifyDobControllerProvider>(context,
                      listen: false)
                  .DobFieldController,
            ),
            InputField(
              title: "Email",
              onType: Provider.of<VerifyDobControllerProvider>(context,
                      listen: false)
                  .EmailFieldController,
            ),
            SizedBox(height: 20),
            RoundedSidedButton(
                onTap: () async {
                  String token = Provider.of<VerifyMobileControllerProvider>(
                          context,
                          listen: false)
                      .GetToken();
                  bool status = await Provider.of<VerifyDobControllerProvider>(
                          context,
                          listen: false)
                      .RegisterInfo(token);
                  if (status) {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                },
                ButtonText: "Continue"),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
