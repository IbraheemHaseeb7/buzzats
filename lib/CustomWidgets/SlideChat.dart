import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';

import 'UserChat.dart';

class SlideChat extends StatelessWidget { 
   @override
  Widget build(BuildContext context) {
    return Slidable(
                startActionPane: ActionPane(
                  motion: const StretchMotion(), 
                 children:
                 [
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: const Color.fromARGB(255, 130, 12, 3),
                    icon: IconlyLight.delete,
                    
                    )
                 ]
                 
                 ),
                child: UserChat());
  }
}
