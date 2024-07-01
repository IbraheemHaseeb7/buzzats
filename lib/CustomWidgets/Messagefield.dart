import 'package:flutter/material.dart';

class Messagefield extends StatefulWidget{
  const Messagefield({super.key});

  @override
  Message createState() => Message();

}

class Message extends State<Messagefield>{

  
  final disabledStyle =   const Color.fromARGB(255, 123, 123, 123);
  final enabledStyle =  const Color(0xFF96B7DF);
          

  bool isEmpty = true;


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;




    return Container(
      height: 60,
      width: screenWidth-50,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
     
      ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.multiline,
            maxLines: null,
              onChanged: (value) {
                            setState(() {
                              isEmpty = value.isEmpty;
                            });
                          },
            decoration: InputDecoration(
              //  IconButton(
              //   onPressed: null,
              //   icon: Icon(IconlyLight.send,size: 25, color: isEmpty ? disabledStyle : enabledStyle,),
              //   iconSize: 10,
              // ),

              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              hintText: "Type Message",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
            ),
          ),
        );
  }

}