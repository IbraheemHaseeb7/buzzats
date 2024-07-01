
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/Cache/UserProfile.dart';

import '../CustomWidgets/CustomDropDownMenu.dart';
import 'Home.dart';

class PhoneNumber extends StatelessWidget {
  Function nextPage, previousPage;
  PhoneNumber({super.key, required this.nextPage, required this.previousPage});

  @override
  Widget build(BuildContext context) {
    UserData();
    String q =
        "select us.[Name] from tb_UserProfile us where us.UserID = '${UserData.id}'";
    double screenWidth = MediaQuery.of(context).size.width;
    String name = "";
    double screenHeight = MediaQuery.of(context).size.height;
    List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

    void Name() {
      query(q).then((value) => name = value.toString());
    }

    return Scaffold(
        backgroundColor: const Color(0xff141d26),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                  child: const Text("Welcome to Buzzats",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 50,
                        color: Color(0xffffffff),
                      ))),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  "Set up your profile to get buzzin",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xffa099fc),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  "lib\\Assets\\profile.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 10),
                width: screenWidth - 50,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "03XXXXXXXXX",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle: const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: screenWidth - 50,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "kuch@bhi.com",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle: const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Recovery Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: screenWidth - 50,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110)),
                    hintText: "Describe yourself to the whole community...",
                    labelStyle: const TextStyle(color: Colors.white),
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xffa099fc)),
                    labelText: "Buzzio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              )),
              CustomDropdown(
                width: screenWidth - 50,
                items: semesters.map((e) => e.toString()).toList(),
                value: "1", // Pass the selected value here
                onChanged: (newValue) {
                  // Handle dropdown value changes here
                  // setState(() {
                  //   selectedSemester = newValue;
                  // });
                  
                },
                labelText: "Semester",
              ),
              Center(
                child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: screenWidth - 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(102, 26, 255, 0.612)),
                        foregroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 255, 255, 1)),
                        fixedSize: MaterialStateProperty.all(const Size(400, 55)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                      ),
                      child: const Text("Let's Buzzz!!"),
                    )),
              ),
            ],
          ),
        ));
  }
}
