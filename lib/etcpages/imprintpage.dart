import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImprintPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Impressum")
        ),
        body: Text("impressum"),
    );
  }
}