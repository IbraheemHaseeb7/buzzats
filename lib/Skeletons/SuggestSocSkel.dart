import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class SuggestSocSkel extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Container(
      
        decoration: BoxDecoration(
          //color: Color(0xFF141D26),
          border: Border(
                top: BorderSide(color: Colors.grey, width: 0.2),
                bottom: BorderSide(color: Colors.grey,width: 0.2)
              ),
        ),
        child:  Shimmer.fromColors(
                       baseColor: Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                        child: Container( width: screenWidth-100,height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:Color(0xFF2E3D4C),),),
                      ),
                      

              );
  }
}
