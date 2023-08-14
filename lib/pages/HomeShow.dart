import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';
import 'package:flutter_app_1/Skeletons/SocietyTwtSkeleton.dart';
import 'package:flutter_app_1/pages/Notifcations.dart';
import 'package:flutter_app_1/Skeletons/TwtSkeleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../CustomWidgets/HomeDrawer.dart';
import '../CustomWidgets/SocietyTweet.dart';
import '../CustomWidgets/TweetWidget.dart';
import 'CreateTweet.dart';


class HomeShow extends StatefulWidget{
  @override
  HomeShowState createState() => HomeShowState();
}

class HomeShowState extends State<HomeShow>{



  @override
  Widget build(BuildContext context) {
 double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isSelected = false;

    
    return Scaffold(
            backgroundColor:Color(0xFF141D26) ,

      appBar:  AppBar(
        backgroundColor: Color(0xFF141D26),
        toolbarHeight: 60,
        
       
        iconTheme: IconThemeData(
          color: Color.fromRGBO(150, 183, 223, 1),
        ),
        centerTitle: true,
        title: Text(
          "Buzzats",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.bold,color: Color.fromRGBO(150, 183, 223, 1) ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
                onPressed: (){ 
                  isSelected = true; 
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notifications()),
                      );},
                icon: Icon(
                  isSelected==true ? IconlyBold.notification :  IconlyLight.notification,
                  size: 30,
                  color: Color.fromRGBO(150, 183, 223, 1),
                  
                )),
          )
        ],
      ),

      body: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              child: Column(
                children: [
                
                  TweetWidget(),
                  TweetWidget(),
                 
                  SocietyTweet(),
                  SocietyTweet(),
                  TweetWidget(),
                  TweetWidget(),
                  TweetWidget(),
                ],
              ),
            )),

              //drawer for extra functions like cui portal

      drawer: HomeDrawer(),

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

    );


  }
  
}