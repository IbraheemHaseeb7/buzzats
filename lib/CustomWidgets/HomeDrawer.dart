

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer{

  FractionallySizedBox drawerr(){
     return  FractionallySizedBox(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                            translation: Offset(0.1, 0.5),
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
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                    ],
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

                        onTap: null,
                        
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