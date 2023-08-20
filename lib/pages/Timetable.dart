import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app_1/CustomWidgets/Days.dart';
import 'package:flutter_app_1/CustomWidgets/Weeks.dart';

import 'TimeCard.dart';



class Timetable extends StatefulWidget {
  @override
  TimetableState createState() => TimetableState();
}

class TimetableState extends State<Timetable> {
 
  int selectedIndex = 0; // Initially, the first day is selected
  List<String> days = ["Mon", "Tues", "Wed", "Thurs", "Fri"];


  List<List<Widget>> courseCards = [
  [
    TimeCard(
      course: "Data Structures and Algorithms",
      teacher: "Imran Latif",
      room: "N-11",
      start: "8:30",
      end: "10:00",
    ),
    TimeCard(
      course: "Differential Equations",
      teacher: "Dr. Younas",
      room: "A-5",
      start: "11:30",
      end: "1:00",
    ),
    TimeCard(
      course: "Differential Equations",
      teacher: "Dr. Hamid Turab",
      room: "D-109",
      start: "4:00",
      end: "5:30",
    ),
   
  ],
  [
    TimeCard(
      course: "Assembly and Microprocessor language",
      teacher: "Sara Muneeb",
      room: "C-11",
      start: "2:30",
      end: "5:30",
    ),
   
   
  ],
  [

  ],
  [
    TimeCard(
      course: "Communication Skills",
      teacher: "Saima Akhtar Chattha",
      room: "D-5",
      start: "8:30",
      end: "10:00",
    ),
   
   
  ],
  [
    
  ]

 
];

List<Widget> emptyDayMessage = [
  Center(
    child: Text(
      "No courses scheduled for this day.",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  )
];


  void selectDay(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(elevation: 0.0, title: Text("TimeTable", style: TextStyle(fontSize: 25),),actions: [

      ],),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10), // Add spacing

           Container(
  height: 60,
  child: ListView.builder(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => selectDay(index),
        child: Days(color: selectedIndex==index? Color(0xFF4137BD) :Colors.transparent , day: days[index])
      );
    },
    itemCount: days.length,
    scrollDirection: Axis.horizontal,
  ),
),


            SizedBox(height: 20), // Add spacing

            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: courseCards[selectedIndex].isEmpty ? emptyDayMessage : courseCards[selectedIndex],
                    options: CarouselOptions(
                      scrollPhysics: ClampingScrollPhysics(),
                      aspectRatio: 3 / 3.3,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0
                    ),
                  ),

            SizedBox(height: 30), // Add spacing

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Weeks(),
              ),
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
