import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Confirmation.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {

     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final decoration = BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30)
            ),
          color: Color(0xFF96B7DF),
          );

    return GestureDetector(
      onLongPress: (){
        showConfirmationDialog(context,"Delete", "Cancel", "Do you want to delete?");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6,top: 8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: screenWidth-150,
            
            padding: EdgeInsets.all(12),
            decoration: decoration,
        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning! Kesi hain ap? I nees to knqow rfvh dfbhkwfhkrhk weefkwebk ",
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