import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Confirmation.dart';


class RecieveMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final decoration = BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
          color: Colors.white,
          );

    return GestureDetector(
      
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6,top: 6),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: screenWidth-150,
            
            padding: EdgeInsets.all(12),
            decoration: decoration,
        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Life is boring man!!",
                  style: TextStyle(color: const Color(0xFF141D26), fontSize: 15),
        
                ),
                SizedBox(height: 6,),
    
              Text("7:44 pm", style: TextStyle(color: const Color(0xFF141D26), fontSize: 12,fontWeight: FontWeight.bold),),
    
              ],
            ),
          ),
        ),
      ),
    );
 
  }

}