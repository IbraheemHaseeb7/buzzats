import 'package:flutter/material.dart';

class SocietyMutual extends StatelessWidget {
  Image image;
  String name;
  SocietyMutual({super.key, required this.image, required this.name});

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
                child: image,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
