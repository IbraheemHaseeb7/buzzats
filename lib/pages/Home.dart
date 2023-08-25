// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Feed.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:flutter_app_1/pages/ChatsHome.dart';
import 'package:flutter_app_1/pages/HomeShow.dart';

import 'package:flutter_app_1/pages/SuggestionPage.dart';
import 'package:flutter_app_1/pages/TotalSocieties.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
    PageController _pageController = PageController(initialPage: 0);
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  static List<Widget> pages = <Widget>[
    HomeShow(),
    SuggestionPage(),
    TotalSocieties(),
    UserProfile(
      myself: true,
    )
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: pages,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFF141D26),
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(72, 72, 72, 1),
                    width: 0.3,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: GNav(
                  backgroundColor: Color(0xFF141D26),
                  color: Color.fromRGBO(150, 183, 223, 1),
                  activeColor: Color(0xFF4137BD),
                  tabBackgroundColor: Color(0xFF4137BD),
                  rippleColor: Color(0xFF4137BD),
                  gap: 4,
                  tabs: [
                    GButton(
                      icon: currentPageIndex == 0
                          ? IconlyBold.home
                          : IconlyLight.home,
                      iconSize: 35.0,
                      backgroundColor: Color(0xFF141D26),
                      onPressed: () {
                        _animateToPage(0);
                      },
                    ),
                    GButton(
                      icon: IconlyLight.search,
                      backgroundColor: Color(0xFF141D26),
                      iconSize: 35.0,
                      onPressed: () {
                        _animateToPage(1);
                      },
                    ),
                    GButton(
                      icon: currentPageIndex == 2
                          ? IconlyBold.user_3
                          : IconlyLight.user_1,
                      backgroundColor: Color(0xFF141D26),
                      iconSize: 35.0,
                      onPressed: () {
                        _animateToPage(2);
                      },
                    ),
                    GButton(
                      icon: currentPageIndex == 3
                          ? IconlyBold.profile
                          : IconlyLight.profile,
                      backgroundColor: Color(0xFF141D26),
                      iconSize: 35.0,
                      onPressed: () {
                        _animateToPage(3);
                      },
                    ),
                  ],
                  selectedIndex: currentPageIndex,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _animateToPage(int index) {
    _animationController.reset();
    _animationController.forward();
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
