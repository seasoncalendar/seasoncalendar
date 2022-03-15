import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/app_data.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/screens/etc/howto_screen.dart';
import 'package:seasoncalendar/screens/home/home_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_language_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_region_screen.dart';
import 'package:seasoncalendar/screens/etc/etc_screen.dart';
import 'package:seasoncalendar/screens/etc/about_screen.dart';
import 'package:seasoncalendar/screens/etc/contrib_screen.dart';
import 'package:seasoncalendar/screens/etc/imprint_screen.dart';
import 'package:seasoncalendar/screens/etc/imgsources_screen.dart';
import 'package:seasoncalendar/screens/etc/support_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (context) {
    return ChangeNotifierProxyProvider2<AppConfig, AppData, FoodDisplayConfiguration>(
      create: (_) =>
        FoodDisplayConfiguration.async(AppConfig.of(context), AppData.of(context)),
      update: (_, config, data, foodDC) {
        foodDC ??= FoodDisplayConfiguration.async(config, data);
        return foodDC..update(config, data);
        },
      child: const HomeScreen()
    );
  },

  "/settings": (context) => const SettingsPage(),
  "/settings/region": (_) => const SettingsRegionPage(),
  "/settings/language": (_) => const SettingsLanguagePage(),
  "/etc": (_) => const EtcPage(),
  "/etc/howto": (_) => const HowToPage(),
  "/etc/about": (_) => const AboutPage(),
  "/etc/contrib": (_) => const ContribPage(),
  "/etc/support": (_) => const SupportPage(),
  "/etc/imprint": (_) => const ImprintPage(),
  "/etc/imprint/imgs": (_) => Consumer<AppData>(
    builder: (_, data, __) {
      return ImgSourcesScreen(data.origFoods);
    },
  ),
};
