// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

void main() 
{
  runApp(Home());
}

class Home extends StatelessWidget{


 @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyApp(), 
      darkTheme: ThemeData(
        brightness: Brightness.light
      ),
      
    );
  
  }
}

class MyApp extends StatelessWidget{

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
                decoration: InputDecoration(
                  hintText: "COMSATS Email Address",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide(color: Color(0xff7b7b7b), width: 1),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(255, 231, 34, 100)),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: null,
                child: Text("Sign In"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromRGBO(102, 26, 255, 0.612)),
                  foregroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 1)),
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
              "images\\Screenshot_2023-07-12_170657-removebg-preview.png",
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    ),
  );
}


}