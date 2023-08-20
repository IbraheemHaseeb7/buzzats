import 'package:flutter/material.dart';

import 'Groups.dart';

class SocietyGroupsContainer extends StatelessWidget {
  List<dynamic> groups;
  SocietyGroupsContainer({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        constraints: const BoxConstraints(minHeight: 500),
        width: screenWidth,
        child: Column(
            children: groups.map((e) {
          return Groups(
            group: e,
            // name: e["SGroupName"],
            // description: e["description"],
          );
        }).toList()));
  }
}
