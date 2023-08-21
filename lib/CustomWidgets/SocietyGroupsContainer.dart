import 'package:flutter/material.dart';
import 'package:flutter_app_1/Skeletons/SuggestSocSkel.dart';

import '../Cache/GroupsCache.dart';
import '../Cache/Query.dart';
import 'Groups.dart';


class SocietyGroupsContainer extends StatefulWidget{
  
  List<dynamic> groups;
  String id;
  bool isGroup;
  SocietyGroupsContainer({Key? key, required this.groups,required this.id,required this.isGroup}) : super(key: key);
  
  @override
  SocietyGroups createState() => SocietyGroups();

}

class SocietyGroups extends State<SocietyGroupsContainer> {
  late String q3;
    


  @override
  void initState(){


    super.initState();

  }


  @override
  void dispose(){
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        constraints: const BoxConstraints(minHeight: 500),
        width: screenWidth,
        child: Column(
            children: widget.isGroup? widget.groups.map((e) {
            print(e);
          return Groups(
            
           // group: e,
             name: e["SGroupName"],
             description: e["description"],
          );
        }).toList():
        [
          SuggestSocSkel(),
          SuggestSocSkel(),
          SuggestSocSkel(),
          
           ] ) );
  }
}
