import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PushNotif extends StatelessWidget {
  const PushNotif({super.key});





  @override
  Widget build(BuildContext context) {

    
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(title: Text("Push Notifications"), actions: [],),
      body: SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
      decoration: BoxDecoration(
        color: Color(0xff141d26),
        
      ),
      padding: EdgeInsets.all(16), // Adjust the padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 2,bottom: 12,left: 12,right: 12),
            child: Text(
              "Society Name",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
    
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              maxLines: null,
               
              decoration: InputDecoration(
               
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                hintText: "Prompt",
                labelText: 'Notification message',
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color:  Color(0xFF212552), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ),
          
           Container(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              maxLines: null,
               
              decoration: InputDecoration(
               
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                hintText: "Inform the reason for this notification",
                labelText: "Description",
                 labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color:  Color(0xFF212552), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                            onPressed: (){Navigator.pop(context);},
                            child: Text("Push"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(102, 26, 255, 0.612)),
                              foregroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(255, 255, 255, 1)),
                              fixedSize: MaterialStateProperty.all(Size(100, 40)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              )),
                            ),
                          ),
                          SizedBox(width: 25,),
                          ElevatedButton(
                            onPressed: null,
                            child: Text("Cancel"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(255, 255, 255, 0.612)),
                              foregroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(0, 0, 0, 1)),
                              fixedSize: MaterialStateProperty.all(Size(100, 40)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              )),
                            ),
                          ),
              ],
            ),
          ),

    
        ],
      ),
      ),
    ),
    );

  }
}