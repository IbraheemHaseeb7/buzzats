
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notif extends StatelessWidget {

  Notif({required this.type});

  String type;
  

  @override
  Widget build(BuildContext context) {
 double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
  
     padding: EdgeInsets.only(top: 15,bottom: 15, left: 10, right: 10 ),
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 33, 47, 61),
        ),
        
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
                      
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(200)),
                              child: Image.asset(
                                "lib\\Assets\\abdu.jpg",
                                width: 35,
                              ),
                            ),
                        
                     
                
          SizedBox(width: 12,),
         

       
 Flexible(
    child: Container(
      width: screenWidth-100,
      padding: EdgeInsets.only(right: 13),  
      child: Text(
        
        type == 'like'
            ? "Username liked this post"
            : type == 'comment'
                ? "Username commented: so sus brother. IEEE is the best in town."
               : type == 'connect'? "Username requested the connection"
               : "Username viewed your profile",
                 // Add more cases if needed
        style: TextStyle(color: Colors.white, fontSize: 14),
        maxLines: null,
      ),
    ),

),
        

           Padding(
             padding: const EdgeInsets.only(top: 0),
             child: Stack(
              alignment: Alignment.bottomLeft,
               children: [
                type != 'follow' &&  type!='view' ?
                 ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  child: Image.asset(
                                    "lib\\Assets\\ieee.jpg",
                                    width: 37,
                                  ),
                                ): type == 'follow' ? ElevatedButton(
        onPressed: null,
        child: Text("Connect" , style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.blue),
        
      ): type == 'view' ? chooseIcon(type):
      Container(),
                              
                              Container(
                
                 decoration: BoxDecoration(
             boxShadow: [
                     BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow offset
                     ),
                   ],
                 ),
                 child: chooseIcon(type)
               ),
                               
               ],
             ),
           ),


        ],
      ),

    );
  }



  Widget chooseIcon(String type) {
  switch (type) {
    case 'like':
      return Icon(
        Icons.favorite,
        color: Colors.red,
        size: 20,
      );
    case 'comment':
      return Icon(
        Icons.comment,
        color: Colors.blue,
        size: 20,
      );
    case 'view':
      return Icon(
        CupertinoIcons.eye,
        color: Colors.white,
        size: 20,
      );

    
  
    default:
      return Container(); // Return an empty Container if none of the cases match
  }
}
}