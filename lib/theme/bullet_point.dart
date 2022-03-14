import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.0,
      width: 9.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
