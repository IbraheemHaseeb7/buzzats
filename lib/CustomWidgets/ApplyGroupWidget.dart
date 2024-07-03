import 'package:flutter/material.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class ApplyGroupWidget extends StatefulWidget {
  bool applied;
  Map<String, dynamic> group;
  ApplyGroupWidget({
    super.key,
    required this.applied,
    required this.group,
  });

  @override
  createState() => ApplyGroupWidgetState();
}

class ApplyGroupWidgetState extends State<ApplyGroupWidget> {
  Color background = const Color(0xff141D26);

  @override
  void initState() {
    super.initState();

    setState(() {
      if (widget.group["applied"]) {
        background = const Color.fromARGB(73, 96, 128, 167);
      } else {
        background = const Color(0xff141D26);
      }
    });
  }

  void handleSelection() {
    if (widget.applied) {
      ToastMe(text: "Already applied", type: ToasterType.Error, duration: 2000)
          .showToast(context);
    } else {
      widget.group["applied"] = !widget.group["applied"];
      setState(() {
        if (widget.group["applied"]) {
          background = const Color.fromARGB(73, 96, 128, 167);
        } else {
          background = const Color(0xff141D26);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: handleSelection,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
              color: background,
              border: Border.all(color: const Color(0xff6080A7)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.group["icon"],
              style: const TextStyle(fontSize: 30),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.group["name"],
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: screenWidth - (screenWidth * 0.3),
                      child: Text(
                        widget.group["description"],
                        style: const TextStyle(color: Color(0xff6080A7)),
                      ),
                    )
                  ]),
            )
          ]),
        ));
  }
}
