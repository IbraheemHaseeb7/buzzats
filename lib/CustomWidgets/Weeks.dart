import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';



class Weeks extends StatelessWidget {
  const Weeks({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    return Container(
        width: 170,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
          ),
      child: const ElevatedButton(
        
        onPressed: null,
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(IconlyBold.arrow_left_2,color: Colors.black,),

            
              Text("Week 1",style: TextStyle(color: Colors.black,fontSize: 20),),
             
            
            Icon(IconlyBold.arrow_right_2,color: Colors.black,),

          ],
        ),
      ),

    );
  }
}