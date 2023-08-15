import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/EditGroup.dart';

class GroupWidget extends StatefulWidget {
  Map<String, dynamic> group;
  GroupWidget({super.key, required this.group});

  @override
  GroupWidgetState createState() => GroupWidgetState();
}

class GroupWidgetState extends State<GroupWidget> {
  void handleEdit() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditGroup(group: widget.group)));
  }

  void handleDelete() {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      width: screenWidth * 0.8,
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            widget.group["name"],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: handleEdit,
              icon: const Icon(Icons.edit),
              color: Colors.white,
            ),
            IconButton(
              onPressed: handleDelete,
              icon: const Icon(Icons.delete),
              color: Colors.white,
            ),
          ],
        )
      ]),
    );
  }
}
