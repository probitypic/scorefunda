import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/Services/Auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:scorefunda/controller/signup_controller_provider.dart';
import 'package:scorefunda/models/signup_model.dart';

class VerifyMobileControllerProvider extends ChangeNotifier {
  late String otp;
  late String _Token;
  AuthApi apis = AuthApi();

  OtpFieldController(String value) {
    otp = value;
  }

  GetToken() => _Token;

  Future<bool> ValidateOtp(String ContactNo) async {
    try {
      http.Response res = await apis.ValidateOtp(ContactNo, otp);
      if (res.statusCode == 200) {
        _Token = jsonDecode(res.body)["data"]["tokendata"]["token"];
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
