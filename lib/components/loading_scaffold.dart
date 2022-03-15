import 'package:flutter/material.dart';

import '../theme/themes.dart';

class LoadingMaterialApp extends StatelessWidget {
  const LoadingMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: defaultTheme,
      darkTheme: defaultTheme,
      home: const LoadingScaffold(),
    );
  }
}

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoadingWidget(),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ));
  }
}
