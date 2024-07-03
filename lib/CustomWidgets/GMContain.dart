import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/GMembers.dart';


class GMContain extends StatefulWidget {
  
  const GMContain({super.key});

  @override
 GMState createState() =>
      GMState();
}

class GMState extends State<GMContain> {

  @override
  void initState() {
    super.initState();
  }

  
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        constraints: const BoxConstraints(minHeight: 500),
        width: screenWidth,
        child: const Column(
          children: [
                    GMembers(),
                    GMembers(),
                    GMembers(),

                
            
          ],
        ));
  }
}
