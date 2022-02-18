import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppFlavor { googleplay, foss }

AppFlavor appFlavorFromString(String flavorStr) {
  switch(flavorStr) {
    case 'foss':
      return AppFlavor.foss;
    case 'googleplay':
    default:
      return AppFlavor.googleplay;
  }
}

String versionCodeSuffixFromAppFlavor(AppFlavor flavor) {
  switch(flavor) {
    case AppFlavor.googleplay:
      return " (g)";
    case AppFlavor.foss:
      return " (f)";
  }
}

class AppConfig extends InheritedWidget {
  final AppFlavor buildFlavor;

  const AppConfig({
    required Widget child,
    required this.buildFlavor,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<AppConfig>();
    assert(result != null, 'No AppConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
