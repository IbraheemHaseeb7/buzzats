
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SlideChat.dart';
import 'package:flutter_app_1/CustomWidgets/UserChat.dart';
import 'package:flutter_app_1/Skeletons/ChatSkeleton.dart';
import 'package:flutter_app_1/pages/SearchChat.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart';
import 'package:iconly/iconly.dart';

import '../CustomWidgets/Requests.dart';

class ChatsHome extends StatelessWidget {
  const ChatsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Messages"),
          
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: null, icon: Icon(IconlyLight.message, size: 30,color: Colors.white,)),
            )

          ],
          
          ),
      



      backgroundColor: Color(0xff141d26),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
             
              SlideChat(),
              UserChat(),
              UserChat(),
              UserChat(),
             
              
              
            ],
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>SearchChat()),
                      // );
        },
        child: Icon(IconlyLight.search),
        backgroundColor: Color(0xFF4137BD),
    ),
    );
}
}