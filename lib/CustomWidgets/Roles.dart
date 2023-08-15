import 'package:flutter/material.dart';

class Roles extends StatefulWidget {
  Function handleDeleteRole;
  Map<String, dynamic> role;
  Roles({super.key, required this.handleDeleteRole, required this.role});

  @override
  createState() => RolesState();
}

class RolesState extends State<Roles> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.8,
      height: 35,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            widget.role["name"],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Row(children: [
            Text(
              "W",
              style: TextStyle(
                  color: widget.role["write"] ? Colors.green : Colors.red),
            ),
            Text(
              "R",
              style: TextStyle(
                  color: widget.role["read"] ? Colors.green : Colors.red),
            ),
            Text(
              "E",
              style: TextStyle(
                  color: widget.role["edit"] ? Colors.green : Colors.red),
            ),
            IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              iconSize: 18,
              onPressed: () {
                widget.handleDeleteRole(widget.role);
              },
            ),
          ]),
        ),
      ]),
    );
  }
}
