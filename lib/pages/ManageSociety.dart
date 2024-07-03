import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/AssignRoles.dart';
import 'package:flutter_app_1/CustomWidgets/CreateGroup.dart';
import 'package:flutter_app_1/CustomWidgets/CreateRoles.dart';
import 'package:flutter_app_1/CustomWidgets/ManageGroups.dart';

class ManageSociety extends StatefulWidget {
  Map<String, dynamic> society;
  ManageSociety({super.key, required this.society});

  @override
  createState() => ManageSocietyState();
}

enum ManageOptions { createGroup, manageGroup, roles, assignRoles }

class ManageSocietyState extends State<ManageSociety> {
  Color createGroupColor = const Color.fromARGB(66, 96, 128, 167);
  Color manageGroupColor = const Color(0xff141D26);
  Color rolesColor = const Color(0xff141D26);
  Color assignRolesColor = const Color(0xff141D26);
  ManageOptions selection = ManageOptions.createGroup;

  void handleCreateGroup() {
    setState(() {
      createGroupColor = const Color.fromARGB(66, 96, 128, 167);
      manageGroupColor = const Color(0xff141D26);
      rolesColor = const Color(0xff141D26);
      assignRolesColor = const Color(0xff141D26);
      selection = ManageOptions.createGroup;
    });
  }

  void handleManageGroup() {
    setState(() {
      manageGroupColor = const Color.fromARGB(66, 96, 128, 167);
      createGroupColor = const Color(0xff141D26);
      rolesColor = const Color(0xff141D26);
      assignRolesColor = const Color(0xff141D26);
      selection = ManageOptions.manageGroup;
    });
  }

  void handleRoles() {
    setState(() {
      rolesColor = const Color.fromARGB(66, 96, 128, 167);
      createGroupColor = const Color(0xff141D26);
      manageGroupColor = const Color(0xff141D26);
      assignRolesColor = const Color(0xff141D26);
      selection = ManageOptions.roles;
    });
  }

  void handleAssignRoles() {
    setState(() {
      assignRolesColor = const Color.fromARGB(66, 96, 128, 167);
      createGroupColor = const Color(0xff141D26);
      manageGroupColor = const Color(0xff141D26);
      rolesColor = const Color(0xff141D26);
      selection = ManageOptions.assignRoles;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff141d26),
      appBar: AppBar(
        title: const Text("Manage Society"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xff6080A7)))),
              width: screenWidth,
              height: 35,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        width: screenWidth * 0.4,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  createGroupColor)),
                          onPressed: handleCreateGroup,
                          child: const Text(
                            "Groups",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        width: screenWidth * 0.4,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  manageGroupColor)),
                          onPressed: handleManageGroup,
                          child: const Text(
                            "Manage Groups",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        width: screenWidth * 0.4,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(rolesColor)),
                          onPressed: handleRoles,
                          child: const Text(
                            "Roles",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        width: screenWidth * 0.4,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  assignRolesColor)),
                          onPressed: handleAssignRoles,
                          child: const Text(
                            "Assign Roles",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ]),
              )),
          (() {
            switch (selection) {
              case ManageOptions.createGroup:
                return const CreateGroup();
              case ManageOptions.manageGroup:
                return ManageGroups(groups: widget.society["groups"]);
              case ManageOptions.roles:
                return CreateRoles(society: widget.society);
              case ManageOptions.assignRoles:
                return AssignRoles(society: widget.society);
              default:
                return const CreateGroup();
            }
          })(),
        ],
      )),
    );
  }
}
