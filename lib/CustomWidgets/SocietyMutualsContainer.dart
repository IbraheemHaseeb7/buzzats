import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/MutualsCache.dart';
import 'package:flutter_app_1/CustomWidgets/SocietyMutual.dart';
import 'package:flutter_app_1/Skeletons/SuggestUserSkel.dart';

import '../Cache/Query.dart';
import '../Cache/UserProfile.dart';

class SocietyMutualsContainer extends StatefulWidget {
  List<dynamic> members;
  String id;
  bool isMutual;
  SocietyMutualsContainer({
    super.key, 
    required this.members,
    required this.id,
    required this.isMutual,
    });

  @override
  _SocietyMutualsContainerState createState() =>
      _SocietyMutualsContainerState();
}

class _SocietyMutualsContainerState extends State<SocietyMutualsContainer> {
  

  late String q3;
  List<dynamic> sameMutuals = [];
  
        
  
  @override
  void initState() {
    UserData();

   q3 = "select prof.UserID,prof.[Name],prof.BIO, prof.[Image]	from tb_UserProfile prof inner join tb_SocietyMembers members on members.UserID = prof.UserID where prof.UserID in (select frn.FriendUserID from tb_Friends frn where frn.UserID = '${UserData.id}' and members.SocietyID = '${widget.id}')";



    MutualsCache.fetchMutuals().then((value) {
 
    widget.members = value;
    print(widget.members);
  

    for(int index =0;index<value.length;index++)
    {

        print(value[index]["SocietyID"]);
        if(value[index]["SocietyID"]==widget.id)
        {
          setState(() {
         print("fghhjfegfvgjevj  $value");
          widget.isMutual = true; 
          print("neyvhwev    ${value[index]["Mutual"]}");
          sameMutuals = value[index]["Mutual"];
          
         
            print(sameMutuals);
          }  );
           return;
        }
      

    }
    query(q3).then((e){

           setState(() {
            
            widget.members.add({"Mutual":e , "SocietyID":widget.id});
            MutualsCache.storeMutuals(widget.members);
            sameMutuals = e;
          
            widget.isMutual = true;
            print("wurey   $sameMutuals");

          });
       

    });

    });




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
                    hintText: "Search",
                    hintStyle:
                        const TextStyle(color: Color(0xff6080A7), fontSize: 12)),
              ),
            ),
            Container(
              child: Column(
                  children: widget.isMutual ? sameMutuals
                      .map((e) {
                        return SocietyMutual(
                          image:e["Image"], 
                          name: e["Name"] ?? "");

                      }
                      )
                      .toList() : [const SuggestUserSkel(),]),
            )
          ],
        ));
  }
}
