import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SimpleRoles.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

import 'Roles.dart';

class CreateRoles extends StatefulWidget {
  Map<String, dynamic> society;
  CreateRoles({super.key, required this.society});

  @override
  createState() => CreateRolesState();
}

class CreateRolesState extends State<CreateRoles> {
  final roleNameController = TextEditingController();
  Color inputColor = Colors.white;
  List<String> roles = [];

  @override
  void initState() {
    roles = [...widget.society["roles"]];
    super.initState();
  }

  @override
  void dispose() {
    roleNameController.dispose();
    super.dispose();
  }

  void handleRoleName(String data) {}

  void handleAddRole() {
    setState(() {
      roles.add(roleNameController.text);
    });

    roleNameController.text = "";
  }

  void handleDeleteRole(String role) {
    setState(() {
      roles.remove(role);
    });
  }

  void handleSubmit() {
    widget.society["roles"] = [...roles];
    ToastMe(
            text: "Successfully made changes",
            duration: 2000,
            type: ToasterType.Check)
        .showToast(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: screenWidth * 0.8,
          child: TextFormField(
            controller: roleNameController,
            onChanged: handleRoleName,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Color(0xffffffff),
            ),
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: inputColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: inputColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: inputColor, width: 2),
              ),
              labelText: "Role Name",
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 15,
                color: Color(0xffa099fc),
              ),
              hintText: "Anything",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color.fromARGB(129, 255, 255, 255),
              ),
              filled: true,
              fillColor: Color(0x00ffffff),
              isDense: false,
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: screenWidth * 0.8,
          height: 250,
          child: ListView.builder(
              itemCount: roles.length,
              itemBuilder: (BuildContext buildContext, int index) {
                return SimpleRoles(
                    role: roles[index], handleDeleteRole: handleDeleteRole);
              }),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: screenWidth * 0.8,
          height: 35,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: handleAddRole,
              child: const Text("Add Role")),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: screenWidth * 0.8,
          height: 35,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: handleSubmit,
              child: const Text("Submit Changes")),
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }
}
