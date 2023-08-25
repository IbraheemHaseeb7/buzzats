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

final _completers = <String, Completer<List<dynamic>>>{};

Future<List<dynamic>> socketQuery(String query) async {
  Completer<List<dynamic>> completer =
      Completer<List<dynamic>>(); // Create a Completer object
  _completers["event"] = completer;

  socket.emit("query", [query, UserData.id, ""]);

  socket.on("query", (data) {
    final completer = _completers.remove("event");
    if (completer != null) {
      completer
          .complete(data[0]["data"]); // Complete the Completer with the data
    }
  });

  socket.onError((data) {
    final completer = _completers.remove("event");
    if (completer != null) {
      completer.completeError(
          throw Error()); // Complete the Completer with an empty list
    }
  });

  return completer.future; // Return the Future from the Completer
}
