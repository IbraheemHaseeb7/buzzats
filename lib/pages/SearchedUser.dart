import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/UserProfile.dart';

import 'EditProfile.dart';

class SearchedUser extends UserProfile {
  const SearchedUser({super.key});

  @override
  createState() => SearchedUserState();
}


class SearchedUserState extends UserProfileState{

  bool isPressed = false;
  int count =0;


  final enabledStyle =  ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 33, 243, 117)// Default background color
                            
                            ),
                                  foregroundColor:
                                    MaterialStatePropertyAll(Colors.transparent),
                                fixedSize: MaterialStatePropertyAll(Size(95, 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                              );

final disabledStyle =  ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xFF5F80A6)),// Default background color
                            
                          
                               
                                  foregroundColor:
                                    MaterialStatePropertyAll(Colors.transparent),
                                fixedSize: MaterialStatePropertyAll(Size(95, 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                              );






  @override
  Column generateButtons(){
    return Column(
      children: [
        ElevatedButton(
                              onPressed:(){ 
                                setState(() {
                                  count = (count+1)%2;
                                  if(count==1)
                                  {
                                    isPressed =true;
                                    
                                  }
                                  if(count==0)
                                  {
                                    isPressed = false;
                                  }
                                  

                                  
                                });
                              },
                              style: isPressed ? enabledStyle : disabledStyle,
                              child: Text(
                                isPressed ? "Connected" : "Connect",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
        ),
        SizedBox(height: 10,),
                ElevatedButton(
                              onPressed: null,
                              
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.transparent),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.transparent),
                                fixedSize: MaterialStatePropertyAll(Size(95, 10)),
                                shape: MaterialStateProperty.all(
                                  
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color:Color(0xFF5F80A6),),
                                  
                                )
                                ),
                                
                              ),
                              child: Text(
                                "Message",
                                style: TextStyle(color: Colors.white ,fontSize: 12,),
                                textAlign: TextAlign.center,
                              ),
        ),
      ],);
  }

  
}