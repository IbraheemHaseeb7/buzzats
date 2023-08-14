import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Messagefield.dart';
import 'package:flutter_app_1/CustomWidgets/RecieveMessage.dart';
import 'package:flutter_app_1/CustomWidgets/SendMessage.dart';
import 'package:iconly/iconly.dart';



class ChatIn extends StatelessWidget {
  const ChatIn({super.key});

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
       backgroundColor: Color(0xff141d26),
      body: Column(
        children: [
          Container(
            
            height: 100,
            padding: EdgeInsets.only(top: 25, left: 8),
            decoration:BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white)
              ),
               color: Color(0xff141d26),
            ) ,

        
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back, color: Colors.white,)),
                    SizedBox(width: 3,),
                    ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(200)),
                                  child: Image.asset(
                                    "lib\\Assets\\abdu.jpg",
                                    width: 45,
                                  ),
                                ),

                                        SizedBox(width: 10,),
                                 Text("Abdullah Sajjad", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                        SizedBox(width: 4,),
                                        Icon(Icons.verified_rounded, color: Colors.white,size: 18,),
                                        SizedBox(width: screenWidth-310,),
                                        IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: Colors.white,)),
                

                SizedBox(height: 20),

              ],
            ),



          ),
          Expanded(
            child: ListView(
              
              children: [
                SizedBox(height: 20),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                // Add more message widgets as needed
              ],
            ),
          ),
                
          Messagefield(),

        ],
      ),

       
    );
  }
}