import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/UserChat.dart';
import 'package:iconly/iconly.dart';

class RequestHome extends StatelessWidget {
  const RequestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Requests"),
          
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: null, icon: Icon(IconlyLight.delete, size: 25,color: Colors.white,)),
            ),
           

          ],
          
          ),
      



      backgroundColor: Color(0xff141d26),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
             UserChat(),
             UserChat(),
              
              
            ],
          ),
        ),
      ),
    );
  }
}