import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/ApplyGroupWidget.dart';
import 'package:flutter_app_1/CustomWidgets/Groups.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class Apply extends StatefulWidget {
  Map<String, dynamic> society;
  Apply({super.key, required this.society});

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  Color applyButtonColor = const Color.fromRGBO(102, 26, 255, 0.612);
  String applyButtonText = "Apply";
  List<Map<String, dynamic>> groups = [];

  @override
  void initState() {
    groups = widget.society["groups"];
    if (widget.society["applied"]) {
      setState(() {
        applyButtonText = "Applied";
        applyButtonColor = const Color.fromRGBO(102, 26, 255, 0.178);
      });
    }
    super.initState();
  }

  void handleApplication() {
    if (widget.society["applied"]) {
      ToastMe(text: "Already applied", type: ToasterType.Error, duration: 2000)
          .showToast(context);
    } else {
      setState(() {
        applyButtonText = "Applied";
        applyButtonColor = const Color.fromRGBO(102, 26, 255, 0.178);
      });
      widget.society["applied"] = true;
      ToastMe(
              text: "Successfully applied",
              type: ToasterType.Error,
              duration: 2000)
          .showToast(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff141D26),
      appBar: AppBar(
        backgroundColor: const Color(0xff141D26),
        title: const Text(
          "Apply",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          width: screenHeight,
          height: screenHeight - AppBar().preferredSize.height,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15),
                width: screenWidth,
                child: Text(
                  "Apply in ${widget.society["name"]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15),
                width: screenWidth - 100,
                child: Text(
                  widget.society["applyLine"],
                  style: const TextStyle(
                    color: Color(0xff6080A7),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                child: Column(
                  children: groups
                      .map((e) => ApplyGroupWidget(
                            group: e,
                            applied: widget.society["applied"],
                          ))
                      .toList(),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  height: 50,
                  width: screenWidth * 0.5,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => applyButtonColor)),
                      onPressed: handleApplication,
                      child: Text(applyButtonText)),
                ),
              )
            ]),
          )),
    );
  }
}
