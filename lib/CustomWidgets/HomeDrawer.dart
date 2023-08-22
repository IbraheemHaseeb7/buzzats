// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/main.dart';
import 'package:flutter_app_1/pages/CUonline.dart';
import 'package:flutter_app_1/pages/Timetable.dart';
import 'package:flutter_app_1/pages/Rooms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatefulWidget {
  @override
  createState() => HomeDrawerState();
}

class HomeDrawerState extends State<HomeDrawer> {
  var image;
  late String email = "";
  late String name = "";

  @override
  void initState() {
    UserData.fetchUser().then((value) {
      setState(() {
        image = value[0]["Image"]["data"];
        email = value[0]["Email"];
        name = value[0]["Name"];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Drawer(
        child: Container(
          height: screenHeight - 400,
          alignment: Alignment.center,
          color: Color(0xFF141D26),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables

              children: [
                DrawerHeader(
                  padding: EdgeInsets.only(left: 6),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: UserAccountsDrawerHeader(
                        margin: EdgeInsets.zero,
                        accountName: Text(name),
                        accountEmail: Text(email),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: MemoryImage(
                              Uint8List.fromList(List<int>.from(image))),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: FractionalTranslation(
                          translation: Offset(0.1, 0.5),
                          child: Icon(
                            LineIcons.alternateUser,
                            color: Colors.white,
                          ),
                        ),
                        title: FractionalTranslation(
                          translation: Offset(0.1, 0.51),
                          child: Text(
                            "CU Online",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),

                        onTap: () async {
                          final Uri url = Uri.parse(
                              "https://cuonline.cuilahore.edu.pk:8091");
                          await launchUrl(url,
                              mode: LaunchMode.inAppWebView,
                              webViewConfiguration:
                                  WebViewConfiguration(enableDomStorage: true));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => CUonline()),
                          // );
                        },
                        //this is the on pressed property of the list tile
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: (){ Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Timetable()),
                          );},
                          child: ListTile(
                            leading: FractionalTranslation(
                              translation: Offset(0.1, 0.5),
                              child: Icon(
                                IconlyLight.time_circle,
                                color: Colors.white,
                              ),
                            ),
                            title: FractionalTranslation(
                              translation: Offset(0.1, 0.5),
                              child: Text(
                                "Timetable",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                        
                            onTap:
                                null, //this is the on pressed property of the list tile
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ListTile(
                          leading: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Icon(
                              Icons.door_back_door_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Text(
                              "Empty Rooms",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (b) => Rooms()));
                          }, //this is the on pressed property of the list tile
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ListTile(
                          leading: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Icon(
                              LineIcons.peopleCarry,
                              color: Colors.white,
                            ),
                          ),
                          title: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Text(
                              "Society",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          onTap:
                              null, //this is the on pressed property of the list tile
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ListTile(
                          leading: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Icon(
                              IconlyLight.category,
                              color: Colors.white,
                            ),
                          ),
                          title: FractionalTranslation(
                            translation: Offset(0.1, 0.5),
                            child: Text(
                              "About Us",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          onTap:
                              null, //this is the on pressed property of the list tile
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight - 400),
                Center(
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.all(
                        1.0), // Optional: Set padding around the text
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 159, 0, 0), // Border color
                        width: 0.2, // Border width
                      ),
                      color: Color.fromARGB(255, 159, 0, 0),
                      borderRadius: BorderRadius.circular(
                          10.0), // Optional: Border radius
                    ),
                    child: ListTile(
                      leading: FractionalTranslation(
                        translation: Offset(0.6, 0.0),
                        child: Icon(
                          IconlyLight.logout,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      title: FractionalTranslation(
                        translation: Offset(0.1, 0.0),
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                          ),
                        ),
                      ),

                     onTap: () async {
  await Main.auth.signOut().then((value) {
    UserData.storeUser([]);

    // Navigate to the main screen and clear the back stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (b) => MyApp()),
      (route) => false,
    );
  }).catchError((onError) {
    ToastMe(
      text: "Could not sign out",
      type: ToasterType.Error,
      duration: 2000,
    ).showToast(context);
  });
},


                      //this is the on pressed property of the list tile
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
