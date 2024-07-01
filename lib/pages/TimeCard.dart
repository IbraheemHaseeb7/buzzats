import 'package:flutter/material.dart';



class TimeCard extends StatelessWidget {

String room,teacher,start,end,course;
  TimeCard({
    super.key,
    required this.course,
    required this.teacher,
    required this.room,
    required this.start,
    required this.end,
    
    });

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;


    return Padding(
              padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: 300,
                    padding: const EdgeInsets.all(8),
                    
                    decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), // Shadow color
                          blurRadius: 9, // Spread of the shadow
                          offset: const Offset(0, 4), // Offset in x and y direction
                        ),
                      ],
                                        color: const Color.fromRGBO(65, 55, 189, 102 / 255.0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 17),
                          child: Text(
                           room,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 17),
                          child: Text(
                            "$start - $end",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 135),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 17),
                          child: Text(
                            teacher,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 17, bottom: 9),
                          child: Text(
                            course,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
  }
}