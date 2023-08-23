import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class UserName extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  Shimmer.fromColors(
                       baseColor: Color(0xFF2E3D4C) ,
                       highlightColor: Colors.white.withOpacity(0.5),
                        child: Container( width: 100,height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:Color(0xFF2E3D4C),),),
                      );
  }

  
}
