import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/models/signup_model.dart';
import 'package:scorefunda/Services/Auth.dart';
import 'package:http/http.dart' as http;

class SignUpControllerProvider extends ChangeNotifier {
  SignUpModel model = SignUpModel();
  AuthApi apis = AuthApi();

  MobileNumberController(String value) {
    model.mobileNo = value;
  }

  UserNameController(String value) {
    model.userName = value;
  }

  PasswordController(String value) {
    model.password = value;
  }

  Future<bool> UserSignUp() async {
    try {
      http.Response res =
          await apis.signUp(model.userName, model.mobileNo, model.password);
      if (res.statusCode == 200) {
        model.otp = jsonDecode(res.body)["data"]["otp"].toString();
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
    return false;
  }
}
