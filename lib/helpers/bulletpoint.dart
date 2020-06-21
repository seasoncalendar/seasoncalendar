import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 9.0,
      width: 9.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}