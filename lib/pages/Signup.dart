// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Function nextPage, previousPage;
  Signup({super.key, required this.nextPage, required this.previousPage});

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF141D26)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 110)),
                    hintText: "COMSATS Email Address",
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(148, 95, 255, 0.612)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 110)),
                    hintText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(148, 95, 255, 0.612)),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    widget.nextPage();
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
