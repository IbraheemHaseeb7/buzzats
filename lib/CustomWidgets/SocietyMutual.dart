import 'dart:typed_data';

import 'package:flutter/material.dart';

class SocietyMutual extends StatefulWidget{
  var image;
  String name;
  SocietyMutual({
    super.key,
     required this.image, 
     required this.name});
  
  @override
  MutualState createState() => MutualState();



}


class MutualState extends State<SocietyMutual> {

late Uint8List imageBytes;
late List<int> imageData;
late  Map<String, dynamic> imageMap;

  @override 
  void initState(){
    super.initState();

imageMap = widget.image;
imageData = List<int>.from(imageMap['data']);
 imageBytes = Uint8List.fromList(imageData);



  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        height: 80,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xff6080A7)))),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: ClipOval(
                child: Image.memory(imageBytes),
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
