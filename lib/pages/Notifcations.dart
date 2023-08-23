import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Notif.dart';

import '../Skeletons/NotifSkeleton.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        
        backgroundColor: Color(0xFF141D26), 
        title: Text("Buzzers",
        style: TextStyle(
          
          color: Colors.white,
           fontSize: 22,
           fontWeight: FontWeight.w900),
           ),

           actions: [],
           ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NotifSkeleton(),
              NotifSkeleton(),
              NotifSkeleton(),
              NotifSkeleton(),
              Notif(
                type: Types.Like,
              ),
              Notif(
                type: Types.Comment,
              ),
              Notif(
                type: Types.View,
              ),
              Notif(
                type: Types.Connect,
              ),
              Notif(
                type: Types.Like,
              ),
              Notif(
                type: Types.Comment,
              ),
              Notif(
                type: Types.View,
              ),
              Notif(
                type: Types.Connect,
              ),
              Notif(
                type: Types.Like,
              ),
              Notif(
                type: Types.Comment,
              ),
              Notif(
                type: Types.View,
              ),
              Notif(
                type: Types.Connect,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
