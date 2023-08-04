
// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/CustomWidgets/Imagepicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class CreateTweet extends StatefulWidget{
  
    CreateTweetState createState() => CreateTweetState();

}



class CreateTweetState extends State<CreateTweet> {

    List<File> images = [];
    TextEditingController tweetController = TextEditingController();
    bool isButtonDisabled= true;
    var twtLimit = "500";

 @override
  void initState() {
    super.initState();
    tweetController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    tweetController.removeListener(updateButtonState);
    tweetController.dispose();
    super.dispose();
  }

  void updateButtonState() {
    setState(() {
      isButtonDisabled = tweetController.text.isEmpty;
    });
  }

   void updateTwtLimit() {
    setState(() {
      twtLimit = (500 - tweetController.text.length).toString();
    });
  }

  void onPickImages() async {
      images = await pickImages();

      setState(() {

      });
  }



  @override
  Widget build(BuildContext context) {
      

      double screenWidth = MediaQuery.of(context).size.width;

       final enabledStyle = ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
          backgroundColor: MaterialStateProperty.all(Color(0xFF4137BD)),
          fixedSize: MaterialStateProperty.all(Size(80, 80)),

          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            
          )
          
          ),
        );



        final disabledStyle = ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)), // Adjust vertical padding
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 78, 72, 160).withOpacity(0.13)),
           fixedSize: MaterialStateProperty.all(Size(80, 80)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )
          
          ),
        );


    return Scaffold(

         backgroundColor: Color(0xFF141D26),

       appBar: AppBar(

          backgroundColor: Color(0xFF141D26),
          elevation: 5.0,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(150, 183, 223, 1),
          ),

        centerTitle: true,
        title: Text(
          "Create a Tweet",
          style: TextStyle(
            color: Color.fromRGBO(150, 183, 223, 1),
            fontSize: 17,
          ),
        ),


    actions: [

  ],
),



body:Container(

      child: Column(
        children: [
          
          Row(

                  children: [
                      Padding(
                      padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                      child:         
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(200)),
                            child: Image.asset(
                              "lib\\Assets\\abdu.jpg",
                              width: 50,
                            ),
                          ),
                     
                    
                    ),


                        Container(
                            padding: const EdgeInsets.only(top: 12, left: 12),
                            width: screenWidth - 90,
                             
                             
                           
                             child:  TextFormField(
                              style: const TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                              onChanged: (value){
                                setState(() {
                                  twtLimit = (500 - value.length).toString();
                                });
                              },
                              maxLength: 500,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,

                              
                              keyboardType: TextInputType.multiline,
                              maxLines: null,

                              controller: tweetController,
                              decoration: InputDecoration(

                                counterStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                 counterText: "$twtLimit character left",
                                

                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 110, 110, 110)),
                                hintText: "What's buzzin'?",
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                                border: InputBorder.none,

                              ),
                            ),
                             ),

                            //we cannot show the images on flutter web but it will working
                    

                  ],
                ),
                             if(images.isNotEmpty)
                             CarouselSlider(
                              items: images.map((file) =>Image.file(file)).toList(), 
                              options: CarouselOptions(
                                height: 400,
                                enableInfiniteScroll: false
                                
                                ),
                      
                    ),
        ],
      ),

      ),

      bottomNavigationBar: Container(

          height: 70,
         decoration: const BoxDecoration(
            color: Color(0xFF141D26),
             // Optional: Add background color
            border: Border(
              top: BorderSide(
              color: Colors.grey, // Border color
              width: 0.4, // Border width
            ),
            ),
          ),
        child: Row(
          children: [
              IconButton(
                onPressed: onPickImages, 
                icon: Icon(Icons.image,color: Color(0xFF4137BD),), 
                alignment: Alignment.centerLeft,
                
                iconSize: 40,
                ),

        SizedBox(width: 260),
              
      Padding(
        padding: const EdgeInsets.only(top:10,bottom: 10,right: 8, left: 8), // Adjust horizontal padding
       
        child: ElevatedButton(
        
        onPressed: isButtonDisabled ? null  : (){

            String twt = tweetController.text;
            Navigator.pop(context);

        },
        style: isButtonDisabled ? disabledStyle : enabledStyle,
         
 
        
        child: Text(
          "Buzzit!",
          style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold), // Adjust font size
        ),
      ),
    ),
              
        ],),
      ),
      );
  }
}




