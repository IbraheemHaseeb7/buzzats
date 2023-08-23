import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SuggestSocSkel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Colors.grey, width: 0.2),
      ),
      child: Shimmer.fromColors(
        baseColor: Color(0xFF2E3D4C),
        highlightColor: Colors.white.withOpacity(0.5),
        child: Container(
          width: screenWidth - 60,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Color(0xFF2E3D4C),
          ),
        ),
      ),
    );
  }
}
