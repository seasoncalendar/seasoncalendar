import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Über die App und ihren Entwickler")
        ),
        body: Text("about"),
    );
  }
}