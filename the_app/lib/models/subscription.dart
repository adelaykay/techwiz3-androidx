import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class Subscription {
  int daysLeft;
  double subAmount;
  String planDetails;
  DateTime subsTime;
  String serviceName;
  Color cardColor;
  Icon icon;

  Subscription(
      {required this.daysLeft,
      required this.subAmount,
      required this.planDetails,
      required this.subsTime,
      required this.serviceName,
        required this.icon,
      required this.cardColor});

  static List<Subscription> subscriptions = [
    Subscription(
        daysLeft: 15,
        subAmount: 9.00,
        icon: Icon(SimpleIcons.netflix, color: Colors.black, size: 40,),
        planDetails: "Standard Plan",
        subsTime: DateTime.now(),
        serviceName: "Netflix",
        cardColor: Color(0xFF80A1C1)),
    Subscription(
      daysLeft: 7,
      subAmount: 12.00,
      planDetails: "Prime Video",
      subsTime: DateTime.now(),
      serviceName: "Amazon Prime",
      icon: Icon(SimpleIcons.amazon, color: Colors.black, size: 40,),
      cardColor: Color(0xffE69597),
    ),
    Subscription(
      daysLeft: 30,
      subAmount: 5.00,
      icon: Icon(SimpleIcons.deezer, color: Colors.black, size: 40,),
      planDetails: "Premium Plan",
      subsTime: DateTime.now(),
      serviceName: "Deezer",
      cardColor: Color(0XFF23F0C7),
    ),
    Subscription(
      daysLeft: 14,
      subAmount: 11.00,
      planDetails: "Ad-Free Plan",
      subsTime: DateTime.now(),
      icon: Icon(SimpleIcons.hulu, color: Colors.black, size: 40,),
      serviceName: "Hulu",
      cardColor: Color(0xffFF7477),
    ),
    Subscription(
      daysLeft: 20,
      subAmount: 9.00,
      planDetails: "Individual Plan",
      subsTime: DateTime.now(),
      serviceName: "Apple Music",
      icon: Icon(SimpleIcons.apple, color: Colors.black, size: 40,),
      cardColor: Color(0xffFFE347),
    ),
    Subscription(
      daysLeft: 30,
      subAmount: 9.00,
      planDetails: "Plus Plan",
      subsTime: DateTime.now(),
      serviceName: "Dropbox Plus",
      icon: Icon(SimpleIcons.dropbox, color: Colors.black, size: 40,),
      cardColor: Color(0xffffffff),
    ),
    Subscription(
      daysLeft: 10,
      subAmount: 8.00,
      planDetails: "Team Plan",
      subsTime: DateTime.now(),
      serviceName: "Notion Team",
      icon: Icon(SimpleIcons.notion, color: Colors.black, size: 40,),
      cardColor: Color(0xFF80A1C1),
    ),
    Subscription(
      daysLeft: 5,
      subAmount: 12.00,
      planDetails: "Premium Plan",
      subsTime: DateTime.now(),
      serviceName: "YouTube Music",
      icon: Icon(SimpleIcons.youtube, color: Colors.black, size: 40,),
      cardColor: Color(0xffE69597),
    ),
    Subscription(
      daysLeft: 30,
      subAmount: 9.00,
      planDetails: "Premium Plan",
      subsTime: DateTime.now(),
      serviceName: "Spotify",
      cardColor: Color(0xff9DFFF9),
      icon: Icon(SimpleIcons.spotify, color: Colors.black, size: 40,)
    ),
    Subscription(
      daysLeft: 14,
      subAmount: 5.00,
      planDetails: "Basic Plan",
      subsTime: DateTime.now(),
      serviceName: "Medium",
      cardColor: Color(0XFF1C77C3),
      icon: Icon(SimpleIcons.medium, color: Colors.black, size: 40,)
    ),
  ];
}
