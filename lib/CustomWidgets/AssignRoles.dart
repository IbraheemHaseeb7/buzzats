import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SimpleRoles.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class AssignRoles extends StatefulWidget {
  Map<String, dynamic> society;
  AssignRoles({super.key, required this.society});

  @override
  _AssignRolesState createState() => _AssignRolesState();
}

class _AssignRolesState extends State<AssignRoles> {
  List<Map<String, dynamic>> members = [];
  List<Map<String, dynamic>> aliases = [];
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
      child: SingleChildScrollView(
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
                    .map((e) => DropdownMenuEntry(value: e, label: e["name"]))
                    .toList()),
          ),
          Container(
              margin: const EdgeInsets.only(top: 15),
              height: 200,
              width: screenWidth * 0.8,
              child: ListView.builder(
                  itemCount: aliases.length,
                  itemBuilder: (builder, count) => Container(
                        width: screenWidth * 0.8,
                        height: 35,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 15),
                                child: Text(
                                  aliases[count]["name"],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Row(children: [
                                  IconButton(
                                    color: Colors.red,
                                    icon: const Icon(Icons.delete),
                                    iconSize: 18,
                                    onPressed: () {
                                      // handleDeleteRole(aliases["id"]);
                                    },
                                  ),
                                ]),
                              ),
                            ]),
                      ))),
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
      ),
    );
  }
}
