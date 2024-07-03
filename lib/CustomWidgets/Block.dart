import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/RoomsContainer.dart';

class Block extends StatefulWidget {
  String name;
  Image image;
  String emptyCount;
  List<dynamic> rooms;
  Block(
      {super.key,
      required this.name,
      required this.emptyCount,
      required this.image,
      required this.rooms});

  @override
  _BlockState createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(alignment: Alignment.center, children: [
              widget.image,
              RoomsContainer(
                rooms: widget.rooms,
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${widget.emptyCount} Rooms free",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
