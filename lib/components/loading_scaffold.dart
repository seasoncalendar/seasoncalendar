import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoadingWidget(),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ));
  }
}
