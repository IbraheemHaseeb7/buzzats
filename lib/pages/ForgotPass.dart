import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/OTP.dart';

void main() {
  runApp(ForgotPassScreen());
}

class ForgotPassScreen extends StatelessWidget {
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
                      height: 65,
                      width: 246,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 320, 0, 10),
                    child: Text(
                      "Enter your new password",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 36,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
                    child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xffa099fc),
                      ),
                      hintText: "••••••••",
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
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide:
                            BorderSide(color: Color(0xff7b7b7b), width: 2),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xffa099fc),
                      ),
                      hintText: "••••••••",
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color.fromRGBO(102, 26, 255, 0.612),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 20,
                    minWidth: MediaQuery.of(context).size.width,
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
