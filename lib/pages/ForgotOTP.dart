import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/ForgotPass.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class ForgotOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(
                  top: 5, left: 25, right: 25, bottom: 15),
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
                    onPressed: null,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassScreen()),
                          );
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
        ))));
  }
}
