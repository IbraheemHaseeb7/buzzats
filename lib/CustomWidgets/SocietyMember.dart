import 'package:flutter/material.dart';

class SocietyMember extends StatelessWidget {
  Image image;
  String name;
  List<String> roles;
  late String roleString = "";
  SocietyMember(
      {super.key,
      required this.image,
      required this.name,
      required this.roles}) {
    for (int i = 0; i < roles.length; i++) {
      if (i == roles.length - 1) {
        roleString = roleString + roles[i];
      } else {
        roleString = roleString + roles[i] + ", ";
      }
    }
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
                child: image,
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
                  Container(
                      width: screenWidth - 120,
                      child: Text(
                        roleString,
                        style: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
