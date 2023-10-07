import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/constants/dimensions.dart';
import 'package:newproject/constants/validator.dart';
import 'package:newproject/provider/loginprovider.dart';
import 'package:provider/provider.dart';

import '../widgets/snackbar.dart';
import 'homePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    LoginProvider login = Provider.of(context);

    var mq = MediaQuery.of(context).size;

    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Login'),
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: login.emailController,
                decoration: InputDecoration(
                    label: Text("Username/ Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.black))),
                autovalidateMode: AutovalidateMode.always,
                validator: (val) => validateEmail(val),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: lineHeight15, bottom: lineHeight20),
                child: TextFormField(
                  controller: login.passwordController,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(lineHeight1),
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.black)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    return val!.isEmpty ? "Enter Password" : null;
                  },
                ),
              ),
              TextButton(
                child: Text(
                  "Login",
                  style:
                      TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size.fromWidth(mq.width),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(lineHeight1))),
                onPressed: () {
                  if (_formKey.currentState!.validate() && login.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(customSnackBar("User Not Found!!!"));
                  }
                },
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                      shape: const StadiumBorder(),
                      elevation: 1),
                  onPressed: () {},

                  //google icon
                  icon:
                      Image.asset('assets/google.png', height: mq.height * .03),

                  //login with google label
                  label: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: 'Login with '),
                          TextSpan(
                              text: 'Google',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
