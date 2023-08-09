import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Reply.dart';
import 'package:flutter_app_1/CustomWidgets/TweetWidget.dart';

class CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        actions: [],
        title: Text("Tweet"),
        centerTitle: true,
        backgroundColor: Color(0xFF141D26),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF141D26),
                  ),
                  alignment: Alignment.center,
                  child: TweetWidget(),
                ),
              ),
            ),
            Container(
              height: screenHeight - 300,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 47, 61),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 20),
                    child: Text(
                      "Comments",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                          Reply(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
