import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/main.dart';
import 'package:flutter_app_1/pages/Signup.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

int pinEntered = 0;

class OTP extends StatefulWidget {
  Function nextPage, previousPage;
  OTP({super.key, required this.nextPage, required this.previousPage});

  @override
  OTPState createState() => OTPState();
}

class OTPState extends State<OTP> {
  bool isPinEntered = false;
  @override
  Widget build(BuildContext context) {
    //sendOTP();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff141d26),
      body: Container(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Image(
                  image: AssetImage("lib/Assets/Buzz-removebg-preview.jpg"),
                  height: 65,
                  width: 246,
                  fit: BoxFit.contain,
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: (screenHeight / 2) - 50, left: 25),
            child: const Text("OTP Code",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 50,
                    color: Color(0xffffffff))),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 15),
            child: const Text(
              "We have sent one time OTP Code on to your given comsats email address",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xffa099fc),
              ),
            ),
          ),
          Center(
            child: OTPTextField(
              outlineBorderRadius: 5,
              keyboardType: TextInputType.number,
              otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: const Color(0xffa099fc),
                  focusBorderColor: const Color(0xffa099fc),
                  backgroundColor: const Color(0xff141d26),
                  borderColor: const Color(0xffa099fc)),
              length: 4,
              width: MediaQuery.of(context).size.width - 50,
              fieldWidth: 50,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: " + pin);
                pinEntered = int.parse(pin);

                setState(() {
                  isPinEntered = true;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 25),
            child: Row(children: [
              const Text(
                "Didn't receive the code yet? ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xffa099fc),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    sendOTP();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.transparent,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff141d26))),
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff4137bd),
                    ),
                  ))
            ]),
          ),
          Center(
            child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (!isPinEntered) {
                      ToastMe(
                              text: "Enter complete OTP",
                              type: ToasterType.Error,
                              duration: 2000)
                          .showToast(context);
                    } else {
                      if (pinEntered == Signup.pinSent) {
                        ToastMe(
                                text: "Registering you in Buzzats...",
                                type: ToasterType.Loading)
                            .showToast(context);
                        Main.auth
                            .createUserWithEmailAndPassword(
                                email: SignupState.emailController.text,
                                password: SignupState.passwordController.text)
                            .then((UserCredential value) {
                          widget.nextPage();
                        }).catchError((error) {
                          ToastMe(
                                  text: "Some error occurred...",
                                  type: ToasterType.Error,
                                  duration: 2000)
                              .showToast(context);
                        });
                      } else {
                        ToastMe(
                                text: "Invalid OTP Code, Try Again",
                                type: ToasterType.Error,
                                duration: 2000)
                            .showToast(context);
                        // widget.nextPage(); // Temporary for fast testing
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(102, 26, 255, 0.612)),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(255, 255, 255, 1)),
                    fixedSize:
                        MaterialStateProperty.all(Size(screenWidth - 50, 55)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    )),
                  ),
                  child: const Text("Enter"),
                )),
          )
        ],
      ))),
    );
  }
}

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(9000) + 1000;
}

Future<bool> sendOTP() async {
  Signup.pinSent = generateRandomNumber();

  const url =
      'https://taupe-daifuku-9eda4e.netlify.app/.netlify/functions/api/mail'; // Replace with your API endpoint URL

  final headers = {'Content-Type': 'application/json'};
  final body = {'email': userEmail, 'code': Signup.pinSent};

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    // successfully sent email
    return true;
  } else {
    return false;
  }
}
