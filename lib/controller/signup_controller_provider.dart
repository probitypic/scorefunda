import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/models/signup_model.dart';
import 'package:scorefunda/Services/Auth.dart';
import 'package:http/http.dart' as http;

class SignUpControllerProvider extends ChangeNotifier {
  SignUpModel model = SignUpModel();
  AuthApi apis = AuthApi();

  getUserName() => model.userName;

  MobileNumberController(String value) {
    model.mobileNo = value;
  }

  UserNameController(String value) {
    model.userName = value;
  }

  PasswordController(String value) {
    model.password = value;
  }

  GetOtp() {
    return model.otp;
  }

  Future<bool> UserSignUp() async {
    try {
      http.Response res =
          await apis.signUp(model.userName, model.mobileNo, model.password);
      if (res.statusCode == 200) {
        model.otp = jsonDecode(res.body)["data"]["otp"].toString();

        return true;
      }
      model.error = jsonDecode(res.body)["message"];
      return false;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
