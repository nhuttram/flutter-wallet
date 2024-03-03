import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> myDataHome = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    "color": Colors.yellow[700],
    'name': "Thức ăn",
    'totalAmount': -420000,
    "date": "Hôm nay"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.gasPump,
      color: Colors.white,
    ),
    "color": Colors.deepOrangeAccent[700],
    'name': "Xăng",
    'totalAmount': -420000,
    "date": "Hôm nay"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    "color": Colors.purple[700],
    'name': "Mua sắm",
    'totalAmount': 500000,
    "date": "Hôm nay"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    "color": Colors.green[700],
    'name': "Sức khỏe",
    'totalAmount': 500000,
    "date": "Hôm nay"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    "color": Colors.blue[700],
    'name': "Du lịch",
    'totalAmount': "500.000",
    "date": "Hôm nay"
  }
];
