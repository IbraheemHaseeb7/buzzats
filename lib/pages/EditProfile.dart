

// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/CustomDropDownMenu.dart';
import 'package:flutter_app_1/pages/FrostedTwt.dart';

import '../CustomWidgets/Imagepicker.dart';


class EditProfile extends StatefulWidget{
  
    EditProfileState createState() => EditProfileState();

}

class EditProfileState extends State<EditProfile> {
  

    List<File> images = [];
    bool isButtonDisabled= true;

     final enabledStyle = ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
          backgroundColor: MaterialStateProperty.all(Color(0xFF4137BD)),
          fixedSize: MaterialStateProperty.all(Size(80, 30)),

          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            
          )
          
          ),
        );



        final disabledStyle = ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 78, 72, 160).withOpacity(0.13)),
           fixedSize: MaterialStateProperty.all(Size(80, 30)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )
          
          ),
        );




   void onPickImages() async {
      images = await pickImages();

      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
       double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];





    return Scaffold(
  backgroundColor: Color(0xFF141D26),

 appBar: AppBar(
    backgroundColor: Color(0xFF141D26),
    elevation: 0.5,
    title: Text("Edit Profile"),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // Add the functionality to navigate back here
        Navigator.pop(context); // This will pop the current route and go back
      },
    ),
    actions: [],
  ),


  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
         Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                  child: const Text("Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                        color: Color(0xffffffff),
                      ))),
                      SizedBox(height: 6,),

        FrostedTwt(
           height: 360,
            width: 320,
          child: Container(
            height: 360,
            width: 320, // Adjust the width of the container as per your requirement
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                   
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Username",
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Abdullah Sajjad",
                            hintStyle: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 137, 137, 137)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                     GestureDetector(
                        onTap: onPickImages,
                         
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("lib/Assets/abdu.jpg"),
                        ),
                      )

                    ],
                  ),
                    SizedBox(height: 7,),
                    Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Phone Number",
                            
                           alignLabelWithHint: true,
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "+9234933922",
                            hintStyle: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 137, 137, 137)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                    Expanded(
                        child:  CustomDropdown(
                    width: screenWidth - 30,
                    items: semesters.map((e) => e.toString()).toList(),
                    value: "1", // Pass the selected value here
                    onChanged: (newValue) {
                      // Handle dropdown value changes here
                      // setState(() {
                      //   selectedSemester = newValue;
                      // });
                    },
                  ),
                      ),
                      SizedBox(height: 7,),
                    Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Recovery Email",
                            
                           alignLabelWithHint: true,
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "dhbfhb@gmail.com",
                            hintStyle: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 137, 137, 137)),
                            ),
                          ),
                        ),
                      ),
        
                      SizedBox(height: 7,),
                    Expanded(
                        child: Container(
                         width: screenWidth - 50,

                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                             maxLines: null,
                            style: TextStyle(color: Colors.white),
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "Buzzio",
                              
                             alignLabelWithHint: true,
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "I wanted to be more professional than to be dumb",
                              hintStyle: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 137, 137, 137)),
                              ),
                            ),
                          ),
                        ),
                      ),
        
        
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 230),
          child: ElevatedButton(
          
          onPressed: isButtonDisabled ? null  : (){
          
             
              Navigator.pop(context);
        
          },
          style: isButtonDisabled ? disabledStyle : enabledStyle,
           
         
          
          child: Text(
            "Buzzit!",
            style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold), // Adjust font size
          ),
              ),
        ),
      ],
    ),
  ),
);

  }
}