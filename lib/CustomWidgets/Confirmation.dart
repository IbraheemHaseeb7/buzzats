import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(BuildContext context,String confirm,String dismiss,String dialog) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevents user from tapping outside to close the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff141d26),
        title: const Text("Confirm", style: TextStyle(color: Colors.white),),
        content: Text(dialog,style: const TextStyle(color: Colors.white),),
        actions: <Widget>[
          TextButton(
            child: Text(dismiss,style: const TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text(confirm,style: const TextStyle(color: Colors.red),),
            onPressed: () {
              // Perform the deletion action
              // You can call your deletion logic here
              Navigator.of(context).pop(); // Close the dialog after deletion
            },
          ),
        ],
      );
    },
  );
}
