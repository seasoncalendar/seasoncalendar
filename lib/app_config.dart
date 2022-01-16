import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  const AppConfig({
      required this.child,
      required this.buildFlavor,
  }): super(child: child);

  static AppConfig of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<AppConfig>();
    assert(result != null, 'No AppConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
