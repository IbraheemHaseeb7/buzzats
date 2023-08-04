// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/HomeDrawer.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:flutter_app_1/pages/CreateTweet.dart';
import 'package:flutter_app_1/pages/Logout.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:fluttertoast/fluttertoast.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141D26),
        toolbarHeight: 70,
        elevation: 5.0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(150, 183, 223, 1),
        ),
        centerTitle: true,
        title: Text(
          "Buzzats",
          style: TextStyle(
            color: Color.fromRGBO(150, 183, 223, 1),
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.bell,
                size: 30,
                color: Color.fromRGBO(150, 183, 223, 1),
              ))
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(150, 183, 223, 1),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GNav(
            backgroundColor: Color(0xFF141D26),
            color: Color.fromRGBO(150, 183, 223, 1),
            activeColor: Color(0xFF4137BD),
            tabBackgroundColor: Color(0xFF4137BD),
            rippleColor: Color(0xFF4137BD),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 35.0,
                backgroundColor: Color(0xFF141D26),
              ),
              GButton(
                icon: Icons.search_outlined,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_fill,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
              ),
              GButton(
                icon: CupertinoIcons.profile_circled,
                backgroundColor: Color(0xFF141D26),
                iconSize: 35.0,
                onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
        },
              ),
            ],
          ),
        ),
      ),

      body: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Column(
              children: [
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
              ],
            ),
          )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateTweet()),
                      );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4137BD),
      ),



      //drawer for extra functions like cui portal

      drawer: HomeDrawer().drawerr(),
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
              child: Text('Cancel', style: TextStyle(color: const Color.fromARGB(255, 120, 255, 125)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                performLogout(context);
              },
              child: Text('Logout', style: TextStyle(color: const Color.fromARGB(255, 143, 11, 2)),),
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
