
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SlideChat.dart';
import 'package:flutter_app_1/CustomWidgets/UserChat.dart';
import 'package:iconly/iconly.dart';


class ChatsHome extends StatelessWidget {
  const ChatsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Messages"),
          
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(onPressed: null, icon: Icon(IconlyLight.message, size: 30,color: Colors.white,)),
            )

          ],
          
          ),
      



      backgroundColor: const Color(0xff141d26),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
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
        backgroundColor: const Color(0xFF4137BD),
        child: const Icon(IconlyLight.search),
    ),
    );
}
}