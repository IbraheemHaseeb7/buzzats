// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Feed.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/CustomWidgets/HomeDrawer.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyTweet.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/pages/ChatsHome.dart';
import 'package:flutter_app_1/pages/CreateTweet.dart';
import 'package:flutter_app_1/pages/HomeShow.dart';
import 'package:flutter_app_1/pages/Logout.dart';
import 'package:flutter_app_1/pages/Society.dart';
import 'package:flutter_app_1/pages/SuggestionPage.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import '../Skeletons/UserSkeleton.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentPageIndex = 0;

  static List<Widget> pages = <Widget>[
    HomeShow(),
    SuggestionPage(),
    ChatsHome(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      bottomNavigationBar: Container(
        height: 80,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(72, 72, 72, 1),
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: GNav(
            backgroundColor: Color(0xFF141D26),
            color: Color.fromRGBO(150, 183, 223, 1),
            activeColor: Color(0xFF4137BD),
            tabBackgroundColor: Color(0xFF4137BD),
            rippleColor: Color(0xFF4137BD),
            gap: 6,
            tabs: [
              GButton(
                icon:
                    currentPageIndex == 0 ? IconlyBold.home : IconlyLight.home,
                iconSize: 35.0,
                backgroundColor: Color(0xFF141D26),
                onPressed: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                },
              ),
              GButton(
                icon: IconlyLight.search,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
              ),
              GButton(
                icon:
                    currentPageIndex == 2 ? IconlyBold.chat : IconlyLight.chat,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
                onPressed: () {
                  setState(() {
                    currentPageIndex = 2;
                  });
                },
              ),
              GButton(
                icon: currentPageIndex == 3
                    ? IconlyBold.profile
                    : IconlyLight.profile,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
                onPressed: () {
                  setState(() {
                    currentPageIndex = 3;
                  });
                },
              ),
            ],
            selectedIndex: currentPageIndex,
            onTabChange: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
      ),
      body: pages.elementAt(currentPageIndex),
    );
  }

  void popUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: const Color.fromARGB(255, 120, 255, 125)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                performLogout(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: const Color.fromARGB(255, 143, 11, 2)),
              ),
            ),
          ],
        );
      },
    );
  }

  void performLogout(BuildContext context) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: 'Logged out successfully!');
  }
}
