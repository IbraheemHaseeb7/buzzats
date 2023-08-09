

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';

class Notifications extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 47, 61), 
        title: Text("Notifications",
        style: TextStyle(
          
          color: Colors.white,
           fontSize: 22,
           fontWeight: FontWeight.w900),
           ),
           ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "follow",),
              Notif(type: "comment",),
              Notif(type: "comment",),
              Notif(type: "comment",),
              Notif(type: "view",),
              Notif(type: "comment",),
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "like",),
              Notif(type: "like",),
              
        ],),
      ),
    );
  }
}