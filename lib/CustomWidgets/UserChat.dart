import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/ChatIn.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  @override
  Widget build(BuildContext context) {
       double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: GestureDetector(
        child: Container(
            padding: EdgeInsets.only(right: 6,left: 6,top: 12,bottom: 12),
            height: 95,
            width: screenWidth-20,
              decoration: BoxDecoration(
                color: Color(0xff141d26),
                //border: Border( bottom: BorderSide(color: Colors.grey)),
               ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(200)),
                                child: Image.asset(
                                  "lib\\Assets\\abdu.jpg",
                                  width: 50,
                                ),
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
                                      Text("Abdullah Sajjad", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                                      SizedBox(width: 4,),
                                      Icon(Icons.verified_rounded, color: Colors.white,size: 18,),
                                      SizedBox(width: screenWidth-322,),
                                      Text("7:44 pm", style: TextStyle(color: const Color.fromARGB(255, 114, 114, 114), fontSize: 13, fontWeight: FontWeight.w600),),
                                      
                                    ],
                                  ),
                                  SizedBox(height: 1,),
                                  
                                      Text("You: Arey kabhi milne aa naa", style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w600),),
                                ],
                              )
                ],
              )
            ),


            onTap:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>ChatIn()),
                      );
        },
      ),
    );
    
  }
}