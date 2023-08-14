import 'package:flutter/material.dart';

class SocietySuggest extends StatefulWidget {
  const SocietySuggest({super.key});

  @override
  State<SocietySuggest> createState() => _SocietySuggest();
}

class _SocietySuggest extends State<SocietySuggest> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(35, 8, 0, 12), 
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: screenWidth - 120,
              height: 135,
              decoration: BoxDecoration(
                color: Color(0xff6080a7).withOpacity(0.3),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: Color(0xff6080a7), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 6, 0, 2),
                          child: Text(
                            "IEEE RAS | CUI Lahore",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 4),
                          child: Text(
                            "Education",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF6080A7),
                              //shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              // border: Border.all(
                              //     color: Color(0xff6080a7), width: 1),
                            ),
                            padding: EdgeInsets.all(4),
                            child: Text(
                              "2K Connections",
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF6080A7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(4),
                            child: Text(
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
                  ),
                  Padding(
                          padding: EdgeInsets.fromLTRB(50, 25, 0, 4),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_sharp), // Replace with the desired icon
                          color: Color(0xFF4137BD),
                          iconSize: 35,
                          onPressed: (){} ,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ]);
  }
}
