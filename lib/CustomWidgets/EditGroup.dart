import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Roles.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

class EditGroup extends StatefulWidget {
  Map<String, dynamic> group;
  EditGroup({super.key, required this.group});

  @override
  createState() => EditGroupState();
}

class EditGroupState extends State<EditGroup> {
  final groupNameController = TextEditingController();
  final groupIconController = TextEditingController();
  final groupDescriptionController = TextEditingController();
  final roleNameController = TextEditingController();
  bool canRead = true;
  bool canWrite = true;
  bool canEdit = true;
  Color inputColor = Colors.white;
  List<Map<String, dynamic>> roles = [];

  void handleGroupName(String data) {}

  void handleGroupIcon(String data) {}

  void handleGroupDescription(String data) {}

  void handleRoleName(String data) {}

  void handleRead(data) {
    setState(() {
      canRead = !canRead;
    });
  }

  void handleWrite(data) {
    setState(() {
      canWrite = !canWrite;
    });
  }

  void handleEdit(data) {
    setState(() {
      canEdit = !canEdit;
    });
  }

  void handleAddRole() {
    setState(() {
      roles.add({
        "name": roleNameController.text,
        "read": canRead,
        "write": canWrite,
        "edit": canEdit
      });
    });

    roleNameController.text = "";
  }

  void handleDeleteRole(Map<String, dynamic> role) {
    setState(() {
      roles.remove(role);
    });
  }

  void handleUpdateGroup() {
    widget.group["name"] = groupNameController.text;
    widget.group["icon"] = groupIconController.text;
    widget.group["description"] = groupDescriptionController.text;
    widget.group["roles"] = roles;

    ToastMe(text: "Updated Group", type: ToasterType.Check, duration: 2000)
        .showToast(context);
  }

  @override
  void initState() {
    groupNameController.text = widget.group["name"];
    groupIconController.text = widget.group["icon"];
    groupDescriptionController.text = widget.group["description"];
    roles = [...widget.group["roles"]];

    super.initState();
  }

  @override
  void dispose() {
    groupNameController.dispose();
    groupIconController.dispose();
    groupDescriptionController.dispose();
    roleNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xff141D26),
        appBar: AppBar(title: Text(widget.group["name"])),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: screenWidth * 0.8,
              child: TextFormField(
                controller: groupNameController,
                onChanged: handleGroupName,
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
                  labelText: "Group Name",
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
              margin: const EdgeInsets.only(top: 20),
              width: screenWidth * 0.8,
              child: TextFormField(
                controller: groupIconController,
                onChanged: handleGroupIcon,
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
                  labelText: "Group Icon",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: Color(0xffa099fc),
                  ),
                  hintText: "💻",
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
              margin: const EdgeInsets.only(top: 20),
              width: screenWidth * 0.8,
              child: TextFormField(
                controller: groupDescriptionController,
                onChanged: handleGroupDescription,
                textAlign: TextAlign.start,
                maxLines: 5,
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
                  labelText: "Group Description",
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
                  contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                ),
                minLines: 5,
                maxLength: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: screenWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff6080A7))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                "Create Roles",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Can read?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: canRead,
                      onChanged: handleRead,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: MaterialStateColor.resolveWith((states) =>
                          const Color.fromRGBO(102, 26, 255, 0.612)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: screenWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Can write?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: canWrite,
                      onChanged: handleWrite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: MaterialStateColor.resolveWith((states) =>
                          const Color.fromRGBO(102, 26, 255, 0.612)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: screenWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Can edit?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: canEdit,
                      onChanged: handleEdit,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: MaterialStateColor.resolveWith((states) =>
                          const Color.fromRGBO(102, 26, 255, 0.612)),
                    ),
                  )
                ],
              ),
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
              child: const Text(
                "Generated Roles",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: screenWidth * 0.8,
              height: 250,
              child: ListView.builder(
                  itemCount: roles.length,
                  itemBuilder: (BuildContext buildContext, int index) {
                    return Roles(
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
                  onPressed: handleUpdateGroup,
                  child: const Text("Update Group")),
            ),
            const SizedBox(
              height: 50,
            )
          ]),
        ));
  }
}
