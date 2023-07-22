
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweetWidget extends StatelessWidget {
  TweetWidget({super.key});

  @override
  Widget build(BuildContext context) {
      
    return GestureDetector(    //used this so that if a user tap the tweet, it opens a new window showing only this tweet and the comments below
      onTap: null,
    child:Container(
        decoration: BoxDecoration(
                    color:  Color(0xFF141D26),

        ),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  
                     Padding(
                       padding: EdgeInsets.only(top:12,left:12,right: 8 ),
                       child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image.asset("lib\\Assets\\abdu.jpg",width: 50,),
                       ),
                     ),
           
                
                      //the username is wrapped in a column as we need a tweet just aligned below the username
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Expanded(
                      
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
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        ),
                        ),
                   
                          Padding(
                            
                            padding: EdgeInsets.only(left: 8),
                            child:  Icon(Icons.verified, color: Colors.white,size: 17,),
                   
                          ),
                   
                        ],),
                          
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 8),
                          child: Text(
                            "WELCOME TO BUZZATS!!!", 
                            style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          
                          ),
                          ),
                          
                        ),
                        
                   
                      Padding(
                        padding: const EdgeInsets.only(top:14.0,bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                  IconButton(
                                    onPressed: null,
                                    icon:Icon(CupertinoIcons.heart, color: Colors.white,), color: Colors.white,),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: null,
                                    icon:Icon(CupertinoIcons.arrow_counterclockwise, color: Colors.white,), color: Colors.white,),
                                  SizedBox(width: 5),
                                   IconButton(
                                    onPressed: null,
                                    icon:Icon(CupertinoIcons.share_up, color: Colors.white,), color: Colors.white,),
                                  SizedBox(width: 5),

                              ],
                            ),
                          SizedBox(height:20 ,),
                            Row(
                              children: [
                                Text("20 likes", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                SizedBox(width:10 ,),
                                Text("4 replies", style: TextStyle(color: Colors.grey, fontSize: 12),),

                              ],
                            ),
                          ],
                        ),
                      )
          
                      ],
          
                     ),
                     ),
                   ),
        
          
               ],
          
        ),
    
    ),);
  }
}