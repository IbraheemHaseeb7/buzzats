import 'package:flutter/material.dart';




class Days extends StatelessWidget{
  String day;
  Color color;

  Days({super.key, 
    required this.color,
    required this.day,

  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 90,
    
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
        ),
        padding: const EdgeInsets.all(8),
        child: MaterialButton(
          onPressed: null,
          child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
        
        
        
        
          ),
        ),
    
      ),
    );
  }





}