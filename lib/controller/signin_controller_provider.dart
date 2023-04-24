import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scorefunda/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:scorefunda/Services/Auth.dart';
import 'package:scorefunda/views/home_screen.dart';

class SignInControllerProvider extends ChangeNotifier {
  SignInModel model = SignInModel();
  AuthApi apis = AuthApi();

  // function to set phoneNumber

  PhoneNumberController(String value) {
    model.phoneNumber = value;
  }

  PasswordController(String value) {
    model.password = value;
  }

  Future<bool> UserSignIn() async {
    try {
      http.Response res =
          await apis.signInApi(model.phoneNumber, model.password);
      if (res.statusCode == 200) {
        model.token = jsonDecode(res.body)["data"]["tokendata"]["token"];
        model.userName = jsonDecode(res.body)["data"]["user"]["name"];
        return true;
      }
    } catch (e) {
      throw e;
    }
    return false;
  }
}
