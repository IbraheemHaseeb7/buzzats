import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/RequestHome.dart';
import 'package:iconly/iconly.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;




    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: GestureDetector(
        child: Container(
            padding: const EdgeInsets.only(right: 6,left: 6,top:3),
            height: 60,
            width: screenWidth-20,
              decoration: const BoxDecoration(
                color: Color(0xff141d26),
                //border: Border( bottom: BorderSide(color: Colors.grey)),
               ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                  padding: EdgeInsets.only(left: 5,right: 4),
                  child: Icon(IconlyLight.message,color: Colors.white,size: 27,),
                ),
                              SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Message requests", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                                      
                                      
                                      
                                    ],
                                  ),
                                      Text("10 requests", style: TextStyle(color: Color.fromARGB(255, 84, 84, 84), fontSize: 13, fontWeight: FontWeight.w600),),
                                 
                                ],
                              )
                ],
              )
            ),

            onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RequestHome()),
                      );
        },
      ),
    );
 
  }
}