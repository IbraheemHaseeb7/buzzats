import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/OTP.dart';

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
      r'^[s,f]{1}[a,p]{1}[0-9]{2}-[a-zA-Z]{3}-[0-9]{3}@cuilahore.edu.pk$');

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
        emailColor = Colors.white;
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

  String? handleEmailValidation(String? e) {}
  String? handlePasswordValidation(String? e) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff141d26),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("lib/Assets/Buzz-removebg-preview.jpg"),
                      height: 50,
                      width: 130,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 300, 0, 10),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 50,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      "Welcome back, let's get buzzin...",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffa099fc),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
                    child: TextFormField(
                      controller: emailController,
                      validator: handleEmailValidation,
                      onChanged: handleEmail,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                      decoration: InputDecoration(
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
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xffa099fc),
                        ),
                        hintText: "xxxx-xxx-xxx@cuilahore.edu.pk",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color.fromARGB(129, 255, 255, 255),
                        ),
                        filled: true,
                        fillColor: Color(0x00ffffff),
                        isDense: false,
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: handlePasswordValidation,
                    onChanged: handlePassword,
                    obscureText: passObscure,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    decoration: InputDecoration(
                      suffix: SizedBox(
                          height: 15,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              color: Colors.white,
                              icon: const Icon(
                                Icons.remove_red_eye,
                                size: 15,
                              ),
                              onPressed: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              })),
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
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xffa099fc),
                      ),
                      hintText: "••••••••",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color.fromARGB(129, 255, 255, 255),
                      ),
                      filled: true,
                      fillColor: Color(0x00ffffff),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(60, 30, 0, 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xff4137bd),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.all(16),
                    textColor: Color(0xffffffff),
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width,
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
