import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Notifcations.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/Replying.dart';
import 'package:flutter_app_1/pages/CommentSection.dart';
import 'package:flutter_app_1/pages/EditProfile.dart';
import 'package:flutter_app_1/pages/GettingStarted.dart';
import 'package:flutter_app_1/pages/Home.dart';

import 'package:flutter_app_1/pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_1/pages/SearchedUser.dart';
import 'package:flutter_app_1/pages/Society.dart';
import 'package:flutter_app_1/pages/SuggestionPage.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'CustomWidgets/Notif.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyApp(),
      home: Notifications(), // add your page for quick testing
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Color.fromRGBO(102, 26, 255, 0.612)),
          hintColor: Colors.white),
    );
  }
}

class MyApp extends StatelessWidget {
  final _regex = RegExp(
      r'^[s,f]{1}[a,p]{1}[0-9]{2}-[a-zA-Z]{3}-[0-9]{3}@cuilahore.edu.pk$');
  bool isLoggedIn = false;
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId:
                "335001544449-tcr0aukdr27rbpcadv12t6engqnokv81.apps.googleusercontent.com")
        .signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                    image: AssetImage("lib\\Assets\\Buzz-removebg-preview.jpg"),
                    height: 65,
                    width: 246,
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
                      onPressed: () async {
                        await signInWithGoogle().then((value) {
                          if (_regex.hasMatch(value.user!.email!)) {
                            isLoggedIn = true;
                          } else {
                            // auth.signOut();
                          }
                        });

                        print(auth.currentUser);
                      },
                      color: Color(0xffffffff),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Color(0xff4137bd), width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      height: 55,
                      minWidth: MediaQuery.of(context).size.width,
                      child: const Text(
                        "          Sign up with Google",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 10),
                      child: Image(
                        image: AssetImage("lib\\Assets\\icons8-google-48.png"),
                        alignment: Alignment.center,
                        height: 33,
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
                          MaterialPageRoute(
                              builder: (context) => GettingStarted()),
                        );
                      },
                      color: Color(0xff4137bd),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: Color(0xff4137bd), width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      textColor: Color(0xffffffff),
                      height: 55,
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
                      child: Image(
                        image: AssetImage(
                            "lib\\Assets\\icons8-circled-envelope-48.png"),
                            alignment: Alignment.center,
                        height: 33,
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
                      SizedBox(width: 2),
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
                          minimumSize: MaterialStateProperty.all(Size(20, 20)),
                        ),
                        child: Text(
                          "Login Here",
                          style: TextStyle(color: Color(0xff4137bd)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
