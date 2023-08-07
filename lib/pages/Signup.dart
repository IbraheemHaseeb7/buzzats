// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

String userEmail = "user@cuilahore.edu.pk";

class Signup extends StatefulWidget {
  Function nextPage, previousPage;
  Signup({super.key, required this.nextPage, required this.previousPage});

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  // CONTROLLERS FOR THE INPUT FIELDS
  bool isCorrectEmail = false;
  bool isCorrectPassword = false;
  bool passObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Color emailColor = Colors.white;
  Color passwordColor = Colors.white;

  // REGEX TO VERIFY EMAIL
  final _regex = RegExp(
      r'^[sSfF]{1}[aApP]{1}[0-9]{2}-[a-zA-Z]{3}-[0-9]{3}@cuilahore\.edu\.pk$');

  void handleEmail(String value) {
    if (emailController.text.length == 29) {
      if (_regex.hasMatch(emailController.text)) {
        setState(() {
          isCorrectEmail = true;
          emailColor = Colors.green;
        });
      } else {
        setState(() {
          isCorrectEmail = false;
          emailColor = Colors.red;
        });
      }
    } else if (emailController.text.length < 29) {
      setState(() {
        isCorrectEmail = false;
        emailColor = Colors.red;
      });
    } else {
      setState(() {
        isCorrectEmail = false;
        emailColor = Colors.red;
      });
    }
  }

  // ON CHANGE HANDLER FOR THE PASSWORD
  void handlePassword(String value) {
    if (passwordController.text.length < 9) {
      setState(() {
        isCorrectPassword = false;
        passwordColor = Colors.red;
      });
    } else {
      setState(() {
        isCorrectPassword = true;
        passwordColor = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF141D26)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "To get started, enter your COMSATS E-mail Id",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    onChanged: (text) {
                      userEmail = text;
                      handleEmail(text);
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 110, 110, 110)),
                      hintText: "COMSATS Email Address",
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Email",
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: emailColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: emailColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: emailColor, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    onChanged: handlePassword,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 110, 110, 110)),
                      hintText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      floatingLabelStyle:
                          TextStyle(color: Color.fromRGBO(148, 95, 255, 0.612)),
                      labelText: "Password",
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: passwordColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: passwordColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: passwordColor, width: 2),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ToastMe(
                              text: "Sending OTP Code",
                              type: ToasterType.Loading,
                              duration: 2000)
                          .showToast(context);
                      Timer(Duration(seconds: 2), () {
                        widget.nextPage();
                      });
                    },
                    child: Text("Sign Up"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(102, 26, 255, 0.612)),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(255, 255, 255, 1)),
                      fixedSize: MaterialStateProperty.all(Size(400, 55)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                "lib\\Assets\\Screenshot_2023-07-12_170657-removebg-preview.png",
                alignment: Alignment.topCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
