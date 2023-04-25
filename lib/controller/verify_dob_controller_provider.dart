import 'package:flutter/material.dart';
import 'package:scorefunda/Services/Auth.dart';
import 'package:scorefunda/models/verify_dob_model.dart';
import 'package:http/http.dart' as http;

class VerifyDobControllerProvider extends ChangeNotifier {
  VerifyDobModel model = VerifyDobModel();
  AuthApi apis = AuthApi();

  DobFieldController(String value) {
    model.dateOfBirth = value;
  }

  EmailFieldController(String value) {
    model.email = value;
  }

  Future<bool> RegisterInfo(String token) async {
    try {
      http.Response res =
          await apis.SignUpInfo(model.dateOfBirth, model.email, token);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
