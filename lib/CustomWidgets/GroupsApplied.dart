import 'package:flutter/material.dart';

class GroupsApplied extends StatefulWidget {
  const GroupsApplied({Key? key}) : super(key: key);

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
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth - 100,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HGHI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Adjust this alignment
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                       
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 25,
                            )),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                       
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.clear_rounded,
                              color: Color.fromARGB(255, 255, 86, 74),
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
