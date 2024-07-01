import 'package:flutter/material.dart';
import 'package:flutter_app_1/Cache/Society.dart';
import 'package:flutter_app_1/pages/Society.dart';

class SocietySuggest extends StatefulWidget {
  String name, about, president, id, presidentId;
  int connections;
  var image;

  SocietySuggest({super.key, 
    required this.name,
    required this.about,
    required this.id,
    required this.connections,
    required this.president,
    required this.presidentId,
    required this.image,
  });

  @override
  State<SocietySuggest> createState() => _SocietySuggest();
}

class _SocietySuggest extends State<SocietySuggest> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => Society(
                      name: widget.name,
                      groups: const [],
                      memberss: const [],
                      image: widget.image,
                      presidentId: widget.presidentId,
                      id: widget.id,
                      about: widget.about,
                      members: widget.connections,
                      society: SocietyData.societies[0],
                      president: widget.president)));
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 8, 0, 12),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: screenWidth - 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff6080a7).withOpacity(0.3),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: const Color(0xff6080a7), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 6, 0, 2),
                              child: Text(
                                widget.name,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 4),
                              child: Text(
                                widget.about,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6080A7),
                                      //shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8),
                                      // border: Border.all(
                                      //     color: Color(0xff6080a7), width: 1),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      "${widget.connections.toString()} Connections",
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6080A7),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Text(
                                      "20 Mutuals",
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 25, 0, 4),
                        child: IconButton(
                          icon: const Icon(Icons
                              .arrow_forward_sharp), // Replace with the desired icon
                          color: const Color(0xff6080a7),
                          iconSize: 35,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]));
  }
}
