import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/GroupWidget.dart';

class ManageGroups extends StatefulWidget {
  List<Map<String, dynamic>> groups;
  ManageGroups({super.key, required this.groups});

  @override
  createState() => ManageGroupsState();
}

class ManageGroupsState extends State<ManageGroups> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double appbarHeight = AppBar().preferredSize.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight - appbarHeight - 40,
      child: ListView.builder(
          itemCount: widget.groups.length,
          itemBuilder: (BuildContext buildContext, int index) {
            return GroupWidget(
              group: widget.groups[index],
            );
          }),
    );
  }
}
