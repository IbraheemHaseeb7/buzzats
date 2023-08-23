import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Feed.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/main.dart';
import 'package:flutter_app_1/pages/ForgotOTP.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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

  // ON CHANGE HANDLER FOR EMAIL
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

  void handleLogin() async {
    final tempController = ToasterController();
    ToastMe(
            text: "Validating...",
            type: ToasterType.Loading,
            controller: tempController)
        .showToast(context);
    Main.auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
      ToastMe(
              text: "Welcome, lets get buzzin!!",
              type: ToasterType.Error,
              duration: 3000)
          .showToast(context);
      await query(
              "SELECT COUNT(f.FriendUserID) AS 'Connections', u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section FROM tb_UserProfile u INNER JOIN tb_Friends f ON f.FriendUserID = u.UserID WHERE u.Email = '${emailController.text}' GROUP BY u.UserID, u.[Name], u.Email, u.Image, u.Department, u.Semester, u.RecoveryEmail, u.BIO, u.DeviceID, u.Token, u.Section;")
          .then((value) {
        UserData.storeUser(value);
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      tempController.end();
    }).catchError((error) {
      tempController.end();

      ToastMe(
              text: "Wrong emai/password",
              type: ToasterType.Error,
              duration: 2000)
          .showToast(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
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
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Welcome Back, Let's get Buzzin!!",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: emailController,
                        onChanged: (text) {
                          handleEmail(text);
                        },
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 110, 110, 110)),
                          hintText: "COMSATS Email Address",
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(
                              color: Color.fromRGBO(148, 95, 255, 0.612)),
                          labelText: "Email",
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: emailColor, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: emailColor, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: emailColor, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        onChanged: handlePassword,
                        decoration: InputDecoration(
                          suffix: SizedBox(
                              height: 15,
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  color: Colors.white,
                                  icon: const Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passObscure = !passObscure;
                                    });
                                  })),
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 110, 110, 110)),
                          hintText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(
                              color: Color.fromRGBO(148, 95, 255, 0.612)),
                          labelText: "Password",
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: passwordColor, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: passwordColor, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: passwordColor, width: 2),
                          ),
                        ),
                        obscureText: passObscure,
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: handleLogin,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(102, 26, 255, 0.612)),
                          foregroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(255, 255, 255, 1)),
                          fixedSize: MaterialStateProperty.all(Size(400, 55)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          )),
                        ),
                        child: const Text("Login"),
                      ),
                    ],
                  )),
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
      ),
    );
  }
}
