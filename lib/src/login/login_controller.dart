import 'package:flutter/material.dart';
import 'package:zini_task/src/homepage/homepage_view.dart';
import 'package:zini_task/src/login/login_service.dart';

class LoginController {
  late LoginService _loginService;
  LoginController() {
    _loginService = LoginService.getInstance();
  }

  void login(String email, String key, BuildContext context) {
    Future<String> response =
        _loginService.login(email, key);
    response.then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(value),
          duration: const Duration(seconds: 2),
        ),
      );
      if (value == 'Authentication successful') {
        Navigator.restorablePushNamed(context, HomePageView.routeName);
      }
    });
  }
}
