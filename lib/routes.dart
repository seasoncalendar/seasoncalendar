import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'settings.dart';
import 'etcpages/aboutpage.dart';
import 'etcpages/contributepage.dart';
import 'etcpages/supportpage.dart';
import 'etcpages/imprintpage.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => HomePage(),
  "/settings": (_) => SettingsPage(),
  "/about": (_) => AboutPage(),
  "/contribute": (_) => ContributePage(),
  "/support": (_) => SupportPage(),
  "/imprint": (_) => ImprintPage(),
};