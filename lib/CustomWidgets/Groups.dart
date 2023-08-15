import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  Map<String, dynamic> group;
  Groups({super.key, required this.group});

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
        Text(
          group["icon"],
          style: const TextStyle(fontSize: 30),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              group["name"],
              style: const TextStyle(color: Colors.white),
            ),
            Container(
              width: screenWidth - (screenWidth * 0.3),
              child: Text(
                group["description"],
                style: const TextStyle(color: Color(0xff6080A7)),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
