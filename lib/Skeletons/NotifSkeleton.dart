import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class NotifSkeleton extends StatelessWidget {
  const NotifSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15,bottom: 15, left: 10, right: 10 ),
        decoration: const BoxDecoration(
          color:Color(0xFF141D26),
        ),
        child: Row(
         // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Shimmer.fromColors(
                baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                child: Container(
                width:40,
                height: 50,
                decoration: const BoxDecoration(
                  color:Color(0xFF2E3D4C) ,
                  shape: BoxShape.circle,
                
                ),),
              ),

               const SizedBox(width: 12,),
               Shimmer.fromColors(
                       baseColor: const Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                        child: Container( width: 150,height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:const Color(0xFF2E3D4C),),),
                      ),
          ]    
        ),

    );
  }
}