import 'dart:typed_data';

import 'package:flutter/material.dart';

class SocietyMember extends StatelessWidget {
  var image;
  String name;
  //List<String> roles;
  late String roleString = "";
  SocietyMember(
      {super.key,
      required this.image,
      required this.name,
     });


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var imageBytes;

     if(image!=null)
    {

    imageBytes = Uint8List.fromList(List<int>.from(image));
    }


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
            Container(
              width: screenWidth - 100,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //     width: screenWidth - 120,
                  //     child: Text(
                  //       roleString,
                  //       style: const TextStyle(color: Colors.white),
                  //     )),
                ],
              ),
            )
          ],
        ));
  }
}
