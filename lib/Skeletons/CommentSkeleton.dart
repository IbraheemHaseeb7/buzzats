import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CommentSkeleton extends StatelessWidget {
  const CommentSkeleton({super.key});

  //const TweetSkeleton({super.key});



  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          //color: Color(0xFF141D26),
          border: Border(
                top: BorderSide(color: Colors.grey, width: 0.2),
                bottom: BorderSide(color: Colors.grey,width: 0.2)
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 5),
              child: Shimmer.fromColors(
                baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                child: Container(
                width:40,
                height: 40,
                decoration: const BoxDecoration(
                  color:Color(0xFF2E3D4C) ,
                  shape: BoxShape.circle,
                
                ),),
              )
            ),

            //the username is wrapped in a column as we need a tweet just aligned below the username
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                      
                                    
                    ],
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 13),
                     child: Shimmer.fromColors(
                      baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                       child: Container( width: screenWidth-120,height: 12,
                        
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:const Color(0xFF2E3D4C),),),
                     ),
                   ),
                    Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Shimmer.fromColors(
                      baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                       child: Container( width: screenWidth-120,height: 12,
                        
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
