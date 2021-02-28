import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
  idx 0: local
  idx 1: land
  idx 2: sea
  idx 3: air
 */

final int avTypeCount = 4;

final List<Widget> avIcons = [
  Icon(Icons.home),
  Icon(Icons.local_shipping),
  Icon(Icons.directions_boat),
  Icon(Icons.airplanemode_active),
];

final List<String> avSettingsKeys = [
  "showAvLocal",
  "showAvLand",
  "showAvSea",
  "showAvAir",
];