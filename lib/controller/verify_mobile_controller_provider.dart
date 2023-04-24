import 'package:flutter/material.dart';

class VerifyMobileControllerProvider extends ChangeNotifier {
  late String otp;

  OtpFieldController(String value) {
    otp = value;
  }

  bool validateOtp(String value) {
    if (otp == value) {
      return true;
    }
    return false;
  }
}
