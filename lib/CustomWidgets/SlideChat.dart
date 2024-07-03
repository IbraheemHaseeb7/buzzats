import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';

import 'UserChat.dart';

class SlideChat extends StatelessWidget {
  const SlideChat({super.key});
 
   @override
  Widget build(BuildContext context) {
    return const Slidable(
                startActionPane: ActionPane(
                  motion: StretchMotion(), 
                 children:
                 [
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Color.fromARGB(255, 130, 12, 3),
                    icon: IconlyLight.delete,
                    
                    )
                 ]
                 
                 ),
                child: UserChat());
  }
}
