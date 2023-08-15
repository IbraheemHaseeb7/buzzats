import 'package:flutter/material.dart';

import 'SocietyMember.dart';

class SocietyMutualsContainer extends StatefulWidget {
  List<Map<String, dynamic>> members;
  SocietyMutualsContainer({super.key, required this.members});

  @override
  _SocietyMutualsContainerState createState() =>
      _SocietyMutualsContainerState();
}

class _SocietyMutualsContainerState extends State<SocietyMutualsContainer> {
  @override
  void initState() {
    super.initState();
  }

  void handleChange(String? value) {
    setState(() {
      if (value == "") {
        widget.members = widget.members;
      }
      for (int i = 0; i < widget.members.length; i++) {
        if (value == widget.members[i]["name"]) {
          widget.members = [widget.members[i]];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        constraints: const BoxConstraints(minHeight: 500),
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 12),
                onChanged: handleChange,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color(0xff6080A7),
                    // filled: true,
                    // fillColor: Color.fromARGB(59, 96, 128, 167),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            color: Color(0xff6080A7), width: 1)),
                    hintText: "Search...",
                    hintStyle:
                        TextStyle(color: Color(0xff6080A7), fontSize: 12)),
              ),
            ),
            Container(
              child: Column(
                  children: widget.members
                      .map((e) => SocietyMember(
                          image: e["image"],
                          name: e["name"],
                          roles: e["roles"]))
                      .toList()),
            )
          ],
        ));
  }
}
