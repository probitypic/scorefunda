import 'package:flutter/material.dart';
import 'package:scorefunda/models/sign_in_model.dart';

class SignInControllerProvider extends ChangeNotifier {
  SignInModel model = SignInModel();

  phoneNumberFieldController(String value) {
    model.password = value;
    notifyListeners();
  }

  passwordFieldController(String value) {
    model.password = value;
    notifyListeners();
  }

  setToken(String token) {
    model.token = token;
  }

  setUserName(String name) {
    model.userName = name;
  }

  getToken() {
    return model.token;
  }

  getUserName() {
    return model.userName;
  }
}
