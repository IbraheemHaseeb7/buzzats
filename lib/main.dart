import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/Signup.dart';
import 'package:flutter_app_1/pages/Login.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Color.fromRGBO(102, 26, 255, 0.612))),
    );
  }
}

class MyApp extends StatelessWidget {
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
                  child:

                      Image(
                    image: AssetImage("lib\\Assets\\Buzz-removebg-preview.jpg"),
                    height: 50,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 170),
                  child: Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Text(
                      "What's Buzzing Today...",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 17,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
                  child: Text(
                    "Sign Up",
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
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text(
                    "Let's get you started...",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xffffffff),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Color(0xff4137bd), width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      child: const Text(
                        "          Sign up with Google",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 10),
                      child:

                          Image(
                        image: AssetImage("lib\\Assets\\icons8-google-48.png"),
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "                      OR                     ",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      color: Color(0xff4137bd),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Color(0xff4137bd), width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      textColor: Color(0xffffffff),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      child: const Text(
                        "          Sign up with Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child:

                          Image(
                        image: AssetImage("lib\\Assets\\icons8-circled-envelope-48.png"),
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
  padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Have an account already?",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(width:2), 
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.transparent),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff141d26)),
                          minimumSize: 
                          MaterialStateProperty.all(Size(20, 20)),    
                        ),
                        child: Text(
                          "Login Here",
                          style: TextStyle(color: Color(0xff4137bd)),
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    ));
  }
}
