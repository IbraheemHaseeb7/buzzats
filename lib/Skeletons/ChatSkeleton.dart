import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ChatSkeleton extends StatelessWidget {
  const ChatSkeleton({super.key});

 



  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return SizedBox(
        width: screenWidth,
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 5),
              child: Shimmer.fromColors(
                baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                child: Container(
                width:80,
                height: 50,
                decoration: const BoxDecoration(
                  color:Color(0xFF2E3D4C) ,
                  shape: BoxShape.circle,
                
                ),),
              )
            ),

            //the username is wrapped in a column as we need a tweet just aligned below the username
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                       baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                        child: Container( width: 100,height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:const Color(0xFF2E3D4C),),),
                      ),
                      SizedBox(width: screenWidth-280,),
                      Shimmer.fromColors(
                        baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                        child: Container( width: 40,height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:const Color(0xFF2E3D4C),),),
                      ),
                                    
                    ],
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 13),
                     child: Shimmer.fromColors(
                      baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                       child: Container( width: screenWidth-200,height: 12,
                        
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:const Color(0xFF2E3D4C),),),
                     ),
                   ),
                   
                       
                 
                ],
              ),
            ),
          ],
        ),
      );
  }
}
