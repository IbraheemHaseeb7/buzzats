import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/PushN.dart';
import 'package:flutter_app_1/CustomWidgets/PushNotif.dart';
import 'package:flutter_app_1/pages/Buzzats.dart';

class HandleNotifs extends StatelessWidget {
  const HandleNotifs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Color(0xff141d26),
      appBar: AppBar(toolbarHeight: 50,elevation: 0, title: Text("Handle"),),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            PushN(),
            PushN(),
            PushN(),


          ],
        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Buzzats()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4137BD),
      ),
      );
  }
}