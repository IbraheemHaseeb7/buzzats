import 'dart:convert';

import 'package:flutter_app_1/Cache/UserProfile.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

IO.Socket socket =
    IO.io('https://shaded-holly-hisser.glitch.me', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': false,
});

void socketConnection() {
  socket.connect();

  UserData();

  socket.onConnect((data) {
    socket.emit("user", UserData.id);
  });

  socket.onDisconnect((data) {
    socket.emit("user_disconnected", UserData.id);
    socket.connect();
  });
}

Future<List<dynamic>> socketQuery(String query) async {
  final completer = Completer<List<dynamic>>(); // Create a Completer object

  socket.emit("query", [query, UserData.id]);

  socket.on("query", (data) {
    completer.complete(data["data"]); // Complete the Completer with the data
  });

  socket.onError((data) {
    completer
        .complete(throw Error()); // Complete the Completer with an empty list
  });

  return completer.future; // Return the Future from the Completer
}
