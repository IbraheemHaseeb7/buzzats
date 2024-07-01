import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Groups extends StatelessWidget {
  String name,description;

  Groups({super.key, required this.name,required this.description});

  // Map<String, dynamic> group;
  // Groups({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      padding: const EdgeInsets.all(10),
      width: screenWidth * 0.9,
    
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff6080A7)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
       const Icon(IconlyLight.camera,color: Colors.white,size: 40,),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: screenWidth - (screenWidth * 0.5),
              child: Column(
                children: [
                  Text(
                    description,
                    style: const TextStyle(color: Color(0xff6080A7)),
                  ),
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }
}
