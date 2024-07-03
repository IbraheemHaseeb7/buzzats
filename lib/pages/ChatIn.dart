import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/Messagefield.dart';
import 'package:flutter_app_1/CustomWidgets/RecieveMessage.dart';
import 'package:flutter_app_1/CustomWidgets/SendMessage.dart';



class ChatIn extends StatelessWidget {
  const ChatIn({super.key});

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
       backgroundColor: const Color(0xff141d26),
      body: Column(
        children: [
          Container(
            
            height: 100,
            padding: const EdgeInsets.only(top: 25, left: 8),
            decoration:const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white)
              ),
               color: Color(0xff141d26),
            ) ,

        
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(CupertinoIcons.back, color: Colors.white,)),
                    const SizedBox(width: 3,),
                    ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(200)),
                                  child: Image.asset(
                                    "lib\\Assets\\abdu.jpg",
                                    width: 45,
                                  ),
                                ),

                                        const SizedBox(width: 10,),
                                 const Text("Abdullah Sajjad", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 4,),
                                        const Icon(Icons.verified_rounded, color: Colors.white,size: 18,),
                                        SizedBox(width: screenWidth-310,),
                                        const IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: Colors.white,)),
                

                const SizedBox(height: 20),

              ],
            ),



          ),
          Expanded(
            child: ListView(
              
              children: const [
                SizedBox(height: 20),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                SendMessage(),
                SizedBox(height: 20),
                RecieveMessage(),
                // Add more message widgets as needed
              ],
            ),
          ),
                
          const Messagefield(),

        ],
      ),

       
    );
  }
}