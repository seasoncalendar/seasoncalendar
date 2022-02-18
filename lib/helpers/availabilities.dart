import 'package:flutter/material.dart';

/*
  idx 0: local
  idx 1: land
  idx 2: sea
  idx 3: air
 */

const int avTypeCount = 4;

const List<Widget> avIcons = [
  Icon(Icons.home),
  Icon(Icons.local_shipping),
  Icon(Icons.directions_boat),
  Icon(Icons.airplanemode_active),
];

const List<String> avSettingsKeys = [
  "showAvLocal",
  "showAvLand",
  "showAvSea",
  "showAvAir",
];
