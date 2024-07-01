import 'package:flutter/material.dart';

class RoomsContainer extends StatefulWidget {
  List<dynamic> rooms;
  RoomsContainer({super.key, required this.rooms});

  @override
  _RoomsContainerState createState() => _RoomsContainerState();
}

class _RoomsContainerState extends State<RoomsContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.9,
      child: Center(
          child: Wrap(
              direction: Axis.horizontal,
              children: widget.rooms
                  .map((e) => Box(available: e["available"], name: e["name"]))
                  .toList())),
    );
  }
}

class Box extends StatelessWidget {
  bool available;
  String name;
  Box({super.key, required this.available, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                !available ? const Color(0xff757575) : const Color(0xff30FF2C)),
        width: 45,
        height: 35,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
