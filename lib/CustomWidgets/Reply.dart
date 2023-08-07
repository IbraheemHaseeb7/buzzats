

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Reply extends StatefulWidget {
  Reply({super.key});

  @override
  ReplyState createState() => ReplyState();
}


class ReplyState extends State<Reply>
{

    bool isLiked = false;

  void handleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    
     double screenWidth = MediaQuery.of(context).size.width;
    return 
      Container(
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 33, 47, 61),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Image.asset(
                  "lib\\Assets\\abdu.jpg",
                  width: 40,
                ),
              ),
            ),

            //the username is wrapped in a column as we need a tweet just aligned below the username
            Padding(
              padding: const EdgeInsets.only(top:12,left: 7,bottom:2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abdullah Sajjad",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  
                    children: [
                      
                        
                       Text(
                          "This is amazing i love this!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 214, 214),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                     
                      SizedBox(width: 130),
                       IconButton(
                                onPressed: handleLike,
                                icon: Icon(
                                  
                                  !isLiked
                                      ? CupertinoIcons.heart
                                      : CupertinoIcons.heart_fill,
                                  color: !isLiked ? Colors.white : Colors.red,
                                ),
                                color: Colors.white,
                                iconSize: 17,
                                alignment: Alignment.topCenter,
                              ),
                      
                            
                    ],
                  ),
                  
                
                ],
              ),
            ),
          ],
        ),
      );

  }



}