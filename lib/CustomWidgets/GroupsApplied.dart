import 'package:flutter/material.dart';

class GroupsApplied extends StatefulWidget {
  GroupsApplied({Key? key}) : super(key: key);

  @override
  GroupsState createState() => GroupsState();
}

class GroupsState extends State<GroupsApplied> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 90,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff6080A7)))),
      child: Row(
      //  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipOval(
              child: Container(
                color: Colors.blue, // Change this color to your desired color
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: screenWidth - 100,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HGHI",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Adjust this alignment
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                       
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 25,
                            )),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                       
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.clear_rounded,
                              color: const Color.fromARGB(255, 255, 86, 74),
                              size: 26,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
