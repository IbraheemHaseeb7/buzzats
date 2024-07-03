import 'package:flutter/material.dart';

import 'GroupsApplied.dart';

class AppliedContain extends StatefulWidget {
  
  const AppliedContain({super.key});

  @override
 AppConState createState() =>
      AppConState();
}

class AppConState extends State<AppliedContain> {

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
                    GroupsApplied(),
                    GroupsApplied(),
                    GroupsApplied(),

                
            
          ],
        ));
  }
}
