import 'package:flutter/material.dart';

class SocietyData {
  static List<Map<String, dynamic>> societies = [
    {
      "president": "Ahmad Zafar",
      "name": "IEEE Ras",
      "followersCount": "200",
      "membersCount": "142",
      "mutualsCount": "23",
      "description": "The largest Tech Group in Comsats Lahore",
      "applyLine": "Become part of the Leading Tech Society in Comsats Lahore",
      "logo": Image.asset("lib/Assets/ieee.jpg"),
      "aliases": [],
      "roles": ["Vice President"],
      "members": [
        {
          "id": "u1",
          "image": Image.asset("lib/Assets/abdu.jpg"),
          "name": "Abdullah Sajjad",
          "roles": ["Director of Tech Group"]
        },
        {
          "id": "u2",
          "image": Image.asset("lib/Assets/musaImage.png"),
          "name": "Musa Raza",
          "roles": ["Director of Tech Group"]
        },
      ],
      "mutuals": [
        {
          "id": "u1",
          "image": Image.asset("lib/Assets/abdu.jpg"),
          "name": "Abdullah Sajjad",
          "roles": ["Director of Tech Group"]
        },
        {
          "id": "u2",
          "image": Image.asset("lib/Assets/musaImage.png"),
          "name": "Musa Raza",
          "roles": ["Director of Tech Group"]
        },
      ],
      "applied": false,
      "groups": [
        {
          "id": "G1",
          "applied": false,
          "name": "Photography",
          "icon": "📷",
          "roles": [
            {"name": "Director", "edit": true, "write": true, "read": true},
            {"name": "Member", "edit": false, "write": false, "read": true},
          ],
          "description":
              "Some description kjahdkfjhaskfdk dskahsd fhaskdhk sadk fksah fkhaskdhksajd fkhas kf hsdha hklds klahsdk hkad hfklas hdklahs kdhkahk ksd ahkh akds fakshd kh "
        },
        {
          "id": "G2",
          "applied": false,
          "name": "Tech Ninjas",
          "icon": "💻",
          "roles": [
            {"name": "Director", "edit": true, "write": true, "read": true},
            {"name": "Member", "edit": false, "write": false, "read": true},
          ], //
          "description":
              "Some description kjahdkfjhaskfdk dskahsd fhaskdhk sadk fksah fkhaskdhksajd fkhas kf hsdha hklds klahsdk hkad hfklas hdklahs kdhkahk ksd ahkh akds fakshd kh "
        },
      ]
    }
  ];

  void writeInLocal() {}
}
