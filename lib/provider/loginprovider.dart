


import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  set emailController(TextEditingController value) {
    _emailController = value;
    notifyListeners();
  }

  TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  set passwordController(TextEditingController value) {
    _passwordController = value;
    notifyListeners();
  }

  bool validate() {

    bool val = false;

    if(_emailController.text == "glitzadmin@gmail.com" && _passwordController.text == "Gs0r0e7!E@)"){
      val = true;
    }else{
      val = false;
    }

    return val;



  }
}