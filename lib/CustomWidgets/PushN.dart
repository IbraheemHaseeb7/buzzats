import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushN extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    

    return Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFF141D26),
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 12, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: 
                    Image.asset(
                        "lib/Assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 40,
                      )
                   
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,bottom: 7,left: 8,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth - 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            //society name
                            Text(
                              "IEEE RAS",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            // (() {
                            //   switch (widget.id) {
                            //     case "fa21bcs052":
                            //     case "fa21bcs140":
                            //     case "fa21bcs082":
                            //       return const Padding(
                            //           padding: EdgeInsets.only(left: 8),
                            //           child: Icon(
                            //             Icons.verified,
                            //             color: Colors.white,
                            //             size: 16,
                            //           ));
                            //     default:
                            //       return Container();
                            //   }
                            // })(),
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 13.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(    //notif body
                      "Event Announcement",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child: Text(    //notif description
                      "We are announcing an event that is going to happen on 24th of August,2023",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 8),
                    width: screenWidth - 100,
                    child:  Text(
                          "20 August 2023",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 114, 114, 114),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                  ),
                  
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: null, 
                      child: Text("Accept",style: TextStyle(color:Colors.white),),
                      
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(102, 26, 255, 0.612)),
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(255, 255, 255, 1)),
                       
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                      ),
                    
                    
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      
                      onPressed: null, 
                      child: Text("Reject",style: TextStyle(color:Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.transparent),
                       
                        
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          
                        )),
                        
                      ),
                      
                      ),
                  ],
                ),
              )    
          ],
        ),
      ),
      ]
        ),
    );


  }



}