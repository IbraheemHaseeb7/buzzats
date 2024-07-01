
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/Cache/socket.dart';

import 'package:flutter_app_1/pages/GettingStarted.dart';
import 'package:flutter_app_1/pages/Home.dart';
import 'package:flutter_app_1/pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_1/pages/Notifcations.dart';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );



//   runApp(const Main());
//   // socketConnection();
// }


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ihmnenvcrzyesjpwmsdw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlobW5lbnZjcnp5ZXNqcHdtc2R3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg5MTQxNzMsImV4cCI6MjAzNDQ5MDE3M30.X-dmdCnLuxNY7D6l28LMG3vhnHz2AnGOxE_3LpQsWMI',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client


class Main extends StatelessWidget {
  // static FirebaseAuth auth = FirebaseAuth.instance;
    
    
    static final supabase = Supabase.instance.client;
    Future<void> signUp(String password,String email) async{
      try {
        await supabase.auth.signUp(
          password: password, 
          email: email,
          );
      } on AuthException catch (e) {
        print(e);
      }
    }
  static const localStorage = FlutterSecureStorage();

  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xff141d26),
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Color(0xff141d26));

    SystemChrome.setSystemUIOverlayStyle(overlayStyle);

    // auth.currentUser != null ? socketConnection() : "";
    final textTheme = Theme.of(context).textTheme;


    return MaterialApp(
      // home: Society(
      //   society: SocietyData.societies[0],
      // ),
      home: MyApp(),

      // home: TotalSocieties(), // add your page for quick testing

      // home: UserProfile(
      //   myself: true,
      // ), // add your page for quick testing

      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          textTheme: GoogleFonts.dmSansTextTheme(textTheme).copyWith(),
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: const Color(0xff141d26)),
          hintColor: Colors.white),
    );
  }
}

class MyApp extends StatelessWidget {
  final _regex = RegExp(
      r'^[s,f]{1}[a,p]{1}[0-9]{2}-[a-zA-Z]{3}-[0-9]{3}@cuilahore.edu.pk$');
  bool isLoggedIn = false;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      backgroundColor: const Color(0xff141d26),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Text(
                    "Welcome",
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
                // Stack(
                //   alignment: Alignment.topLeft,
                //   children: [
                //     MaterialButton(
                //       onPressed: () async {},
                //       color: Color(0xffffffff),
                //       elevation: 1,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(24.0),
                //         side: BorderSide(color: Color(0xff4137bd), width: 1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       textColor: Color.fromARGB(255, 0, 0, 0),
                //       height: 55,
                //       minWidth: MediaQuery.of(context).size.width,
                //       child: const Text(
                //         "          Sign up with Google",
                //         textAlign: TextAlign.start,
                //         style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w500,
                //           fontStyle: FontStyle.normal,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.fromLTRB(20, 5, 0, 10),
                //       child: Image(
                //         image: AssetImage("lib\\Assets\\icons8-google-48.png"),
                //         alignment: Alignment.center,
                //         height: 33,
                //         width: 32,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ],
                // ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       "                      OR                     ",
                //       textAlign: TextAlign.start,
                //       overflow: TextOverflow.clip,
                //       style: TextStyle(
                //         fontWeight: FontWeight.w400,
                //         fontStyle: FontStyle.normal,
                //         fontSize: 14,
                //         color: Color(0xffffffff),
                //       ),
                //     ),
                //   ),
                // ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GettingStarted()),
                        );
                      },
                      color: const Color(0xff4137bd),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: const BorderSide(color: Color(0xff4137bd), width: 1),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: const Color(0xffffffff),
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
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Row(
                    children: [
                      const Text(
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
                      const SizedBox(width: 2),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.transparent),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xff141d26)),
                          minimumSize: MaterialStateProperty.all(const Size(20, 20)),
                        ),
                        child: const Text(
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
