import 'package:flutter/material.dart';

class LoadingScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
