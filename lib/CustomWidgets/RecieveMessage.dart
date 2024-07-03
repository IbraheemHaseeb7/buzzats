import 'package:flutter/material.dart';


class RecieveMessage extends StatelessWidget{
  const RecieveMessage({super.key});

  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const decoration = BoxDecoration(
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
            
            padding: const EdgeInsets.all(12),
            decoration: decoration,
        
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Life is boring man!!",
                  style: TextStyle(color: Color(0xFF141D26), fontSize: 15),
        
                ),
                SizedBox(height: 6,),
    
              Text("7:44 pm", style: TextStyle(color: Color(0xFF141D26), fontSize: 12,fontWeight: FontWeight.bold),),
    
              ],
            ),
          ),
        ),
      ),
    );
 
  }

}