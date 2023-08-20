import 'package:flutter/material.dart';

class GMembers extends StatelessWidget {
 
 GMembers(
      {super.key,
     
  }
 );

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
              // child: ClipOval(
              //   child: image,
              // ),
            ),
            Container(
              width: screenWidth - 100,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "jbwejfb",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: screenWidth - 120,
                      child: Text(
                        "hdbfhkhke",
                        style: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
