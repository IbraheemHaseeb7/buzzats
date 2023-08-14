import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogoutWidget {
  void popUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: const Color.fromARGB(255, 120, 255, 125)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                performLogout(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: const Color.fromARGB(255, 143, 11, 2)),
              ),
            ),
          ],
        );
      },
    );
  }

  void performLogout(BuildContext context) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: 'Logged out successfully!');
  }
}
