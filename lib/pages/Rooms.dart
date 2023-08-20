import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/EmptyRooms.dart';
import 'package:flutter_app_1/Cache/Query.dart';
import 'package:flutter_app_1/CustomWidgets/Block.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  List<Map<String, dynamic>> timeslots = [
    {
      "value": 1,
      "label": "8:30-10:00",
    },
    {
      "value": 2,
      "label": "10:00-11:30",
    },
    {"value": 3, "label": "11:30-1:00"},
    {"value": 4, "label": "1:00-2:30"},
    {"value": 5, "label": "2:30-4:00"},
    {"value": 6, "label": "4:00-5:30"},
    {"value": 7, "label": "5:30-7:00"},
    {"value": 8, "label": "7:00-8:30"},
  ];
  List<String> days = ["Mo", "Tu", "We", "Th", "Fr"];
  int selectedTimeslot = 1;
  String selectedDay = "Mo";
  List<dynamic> ablock = [];
  List<dynamic> bblock = [];
  List<dynamic> cblock = [];
  List<dynamic> dblock = [];
  List<dynamic> nblock = [];
  List<dynamic> oblock = [];
  List<dynamic> schedule = [];
  int aCount = 0;
  int bCount = 0;
  int cCount = 0;
  int dCount = 0;
  int nCount = 0;
  int oCount = 0;
  int renderTimes = 0;

  void handleTimeSlot(var value) {
    selectedTimeslot = value;
    calculate();
  }

  void handleDay(var value) {
    selectedDay = value;
    calculate();
  }

  @override
  void initState() {
    EmptyRooms.isEmpty().then((res) {
      if (res) {
        query("select * from tb_Rooms").then((value) {
          EmptyRooms.storeRooms(value);
          ToastMe(
                  text: "Successfully Fetched",
                  type: ToasterType.Check,
                  duration: 2000)
              .showToast(context);
        }).catchError((err) {
          ToastMe(
                  text: "Error occurred",
                  type: ToasterType.Error,
                  duration: 2000)
              .showToast(context);
        });
      } else {
        EmptyRooms.fetchRooms().then((value) {
          schedule = value;
          calculate();
        });
      }
    });

    super.initState();
  }

  void calculate() {
    ablock = [];
    bblock = [];
    cblock = [];
    dblock = [];
    nblock = [];
    oblock = [];
    aCount = 0;
    bCount = 0;
    cCount = 0;
    dCount = 0;
    nCount = 0;
    oCount = 0;

    // A block
    for (var e in schedule) {
      if (e["Rooms"][0] == "A" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++aCount;
        }
        ablock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    // B block
    for (var e in schedule) {
      if (e["Rooms"][0] == "B" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++bCount;
        }
        bblock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    // C block
    for (var e in schedule) {
      if (e["Rooms"][0] == "C" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++cCount;
        }
        cblock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    // D block
    for (var e in schedule) {
      if (e["Rooms"][0] == "D" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++dCount;
        }
        dblock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    // N block
    for (var e in schedule) {
      if (e["Rooms"][0] == "N" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++nCount;
        }
        nblock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    // O block
    for (var e in schedule) {
      if (e["Rooms"][0] == "O" &&
          e["TimeSlot"] == selectedTimeslot &&
          e["Days"] == selectedDay) {
        if (e["Availability"] == "empty") {
          ++oCount;
        }
        oblock.add(
            {"name": e["Rooms"], "available": e["Availability"] == "empty"});
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Color(0xff141d26),
        body: SingleChildScrollView(
            child: Container(
          width: screenWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: screenWidth * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Empty Rooms",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$selectedDay - ${timeslots[selectedTimeslot - 1]["label"]}",
                      style: const TextStyle(
                          color: Color(0xff5E7692),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Center(
                            child: DropdownMenu(
                                onSelected: handleTimeSlot,
                                initialSelection: selectedTimeslot,
                                width: screenWidth * 0.8,
                                label: const Text("Timeslot"),
                                textStyle: const TextStyle(color: Colors.white),
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                                dropdownMenuEntries: timeslots
                                    .map((e) => DropdownMenuEntry(
                                        value: e["value"],
                                        label: e["label"] ?? ""))
                                    .toList()))),
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Center(
                            child: DropdownMenu(
                                onSelected: handleDay,
                                initialSelection: selectedDay,
                                width: screenWidth * 0.8,
                                label: const Text("Day"),
                                textStyle: const TextStyle(color: Colors.white),
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                                dropdownMenuEntries: days
                                    .map((e) =>
                                        DropdownMenuEntry(value: e, label: e))
                                    .toList()))),
                    Block(
                        emptyCount: aCount.toString(),
                        rooms: ablock,
                        name: "A-Block",
                        image: Image.asset(
                          "lib/Assets/cblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    Block(
                        emptyCount: bCount.toString(),
                        rooms: bblock,
                        name: "B-Block",
                        image: Image.asset(
                          "lib/Assets/cblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    Block(
                        emptyCount: cCount.toString(),
                        rooms: cblock,
                        name: "C-Block",
                        image: Image.asset(
                          "lib/Assets/cblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    Block(
                        emptyCount: dCount.toString(),
                        rooms: dblock,
                        name: "D-Block",
                        image: Image.asset(
                          "lib/Assets/dblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    Block(
                        emptyCount: nCount.toString(),
                        rooms: nblock,
                        name: "N-Block",
                        image: Image.asset(
                          "lib/Assets/nblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    Block(
                        emptyCount: oCount.toString(),
                        rooms: oblock,
                        name: "O-Block",
                        image: Image.asset(
                          "lib/Assets/oblock.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
            )
          ]),
        )));
  }
}
