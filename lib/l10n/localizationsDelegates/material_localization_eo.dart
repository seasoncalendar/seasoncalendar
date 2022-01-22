import 'package:flutter/material.dart';

class MaterialLocalizationEoDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == "eo";
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return MaterialLocalizationEo();
  }

  @override
  bool shouldReload(MaterialLocalizationEoDelegate old) {
    return false;
  }
}

class MaterialLocalizationEo extends DefaultMaterialLocalizations {}
