// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4137BD),
      ),

      //drawer for extra functions like cui portal
      drawer: FractionallySizedBox(
        widthFactor: 0.8,
        child: Drawer(
          child: Container(
            alignment: Alignment.center,
            color: Color(0xFF141D26),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.deepPurple),
                      padding: EdgeInsets.zero,
                      child: UserAccountsDrawerHeader(
                        margin: EdgeInsets.zero,
                        accountName: Text("abdullah"),
                        accountEmail: Text("fa21-bcs-082@gmail.com"),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage("lib\\Assets\\abdu.jpg"),
                        ),
                      )),
                  SizedBox(height: 16),
                  Center(
                    child: ListTile(
                      leading: FractionalTranslation(
                        translation: Offset(0.6, 0.5),
                        child: Icon(
                          CupertinoIcons.person_2,
                          color: Colors.white,
                        ),
                      ),
                      title: FractionalTranslation(
                        translation: Offset(0.11, 0.5),
                        child: Text(
                          "CU Online",
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
                  SizedBox(height: 16),
                  Center(
                    child: ListTile(
                      leading: FractionalTranslation(
                        translation: Offset(0.6, 0.5),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                      title: FractionalTranslation(
                        translation: Offset(0.1, 0.5),
                        child: Text(
                          "Events",
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
                  SizedBox(height: 550),
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
                            Icons.logout,
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

                        onTap:
                            null, //this is the on pressed property of the list tile
                      ),
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
