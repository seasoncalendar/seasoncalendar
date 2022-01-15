import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum AppFlavor {
  googleplay,
  foss
}

AppFlavor appFlavorFromString(String flavorStr) {
  if (flavorStr == "googleplay") {return AppFlavor.googleplay;}
  else if (flavorStr == 'foss') {return AppFlavor.foss;}

  // default case: googleplay
  return AppFlavor.googleplay;
}

String versionCodeSuffixFromAppFlavor(AppFlavor flavor) {
  if (flavor == AppFlavor.foss) {return " (f)";}

  // default case: googleplay
  return " (g)";
}

class AppConfig extends InheritedWidget{
  final Widget child;
  final AppFlavor buildFlavor;

  AppConfig(
      {@required this.child,
       @required this.buildFlavor}
      );

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
