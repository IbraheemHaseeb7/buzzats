import "package:flutter/material.dart";
import "package:toast_notification/ToasterType.dart";
import "package:toast_notification/toast_notification.dart";

import "SimpleRoles.dart";

class SimpleRolesAssign extends StatefulWidget {
  Map<String, dynamic> society;
  SimpleRolesAssign({super.key, required this.society});

  @override
  _SimpleRolesAssignState createState() => _SimpleRolesAssignState();
}

class _SimpleRolesAssignState extends State<SimpleRolesAssign> {
  List<Map<String, dynamic>> members = [];
  List<String> aliases = [];
  final dropdownController = TextEditingController();

  @override
  void initState() {
    members = widget.society["members"];
    aliases = [...widget.society["aliases"]];

    super.initState();
  }

  void handleAliasSelected(e) {
    setState(() {
      aliases.add(e);
    });
  }

  void handleDeleteRole(e) {
    setState(() {
      aliases.remove(e);
    });
  }

  void handleSubmitAlliases() {
    widget.society["aliases"] = aliases;
    ToastMe(
            text: "Successfully made changes",
            type: ToasterType.Check,
            duration: 2000)
        .showToast(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Text(
            "Aliases",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: DropdownMenu(
              width: screenWidth * 0.8,
              enableFilter: true,
              enableSearch: true,
              enabled: true,
              onSelected: handleAliasSelected,
              requestFocusOnTap: true,
              label: const Text("Members"),
              controller: dropdownController,
              inputDecorationTheme: InputDecorationTheme(
                hintStyle:
                    const TextStyle(color: Color.fromARGB(69, 255, 255, 255)),
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              textStyle: const TextStyle(color: Colors.white),
              hintText: "Search Members",
              dropdownMenuEntries: members
                  .map((e) =>
                      DropdownMenuEntry(value: e["name"], label: e["name"]))
                  .toList()),
        ),
        Container(
            margin: const EdgeInsets.only(top: 15),
            height: 200,
            width: screenWidth * 0.8,
            child: ListView.builder(
                itemCount: aliases.length,
                itemBuilder: (builder, count) => SimpleRoles(
                    handleDeleteRole: handleDeleteRole, role: aliases[count]))),
        Container(
            width: screenWidth * 0.8,
            height: 35,
            margin: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: handleSubmitAlliases,
              child: const Text("Submit Alliases",
                  style: TextStyle(color: Colors.white)),
            ))
      ]),
    );
  }
}
