// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class L10n {
  L10n();
  
  static L10n current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      L10n.current = L10n();
      
      return L10n.current;
    });
  } 

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `en`
  String get languageCode {
    return Intl.message(
      'en',
      name: 'languageCode',
      desc: 'The two-character ISO language code of this language.',
      args: [],
    );
  }

  /// `Seasonal foods calendar`
  String get appTitle {
    return Intl.message(
      'Seasonal foods calendar',
      name: 'appTitle',
      desc: 'The title of the app, e.g. \'Seasonal foods calendar\'',
      args: [],
    );
  }

  /// `Central Europe`
  String get centralEurope {
    return Intl.message(
      'Central Europe',
      name: 'centralEurope',
      desc: 'The region of Central Europe.',
      args: [],
    );
  }

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: 'The word \'January\'',
      args: [],
    );
  }

  /// `February`
  String get february {
    return Intl.message(
      'February',
      name: 'february',
      desc: 'The word \'February\'',
      args: [],
    );
  }

  /// `March`
  String get march {
    return Intl.message(
      'March',
      name: 'march',
      desc: 'The word \'March\'',
      args: [],
    );
  }

  /// `April`
  String get april {
    return Intl.message(
      'April',
      name: 'april',
      desc: 'The word \'April\'',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: 'The word \'May\'',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: 'The word \'June\'',
      args: [],
    );
  }

  /// `July`
  String get july {
    return Intl.message(
      'July',
      name: 'july',
      desc: 'The word \'July\'',
      args: [],
    );
  }

  /// `August`
  String get august {
    return Intl.message(
      'August',
      name: 'august',
      desc: 'The word \'August\'',
      args: [],
    );
  }

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: 'The word \'September\'',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: 'The word \'October\'',
      args: [],
    );
  }

  /// `November`
  String get november {
    return Intl.message(
      'November',
      name: 'november',
      desc: 'The word \'November\'',
      args: [],
    );
  }

  /// `December`
  String get december {
    return Intl.message(
      'December',
      name: 'december',
      desc: 'The word \'December\'',
      args: [],
    );
  }

  /// `Imprint`
  String get imprintPageButtonText {
    return Intl.message(
      'Imprint',
      name: 'imprintPageButtonText',
      desc: 'The word \'Imprint\'',
      args: [],
    );
  }

  /// `Explanation`
  String get aboutPageTitle {
    return Intl.message(
      'Explanation',
      name: 'aboutPageTitle',
      desc: 'The word \'Explanation\'',
      args: [],
    );
  }

  /// `How do I use the app?`
  String get aboutPageExplanationHeadline {
    return Intl.message(
      'How do I use the app?',
      name: 'aboutPageExplanationHeadline',
      desc: 'The phrase \'How do I use the app?\'',
      args: [],
    );
  }

  /// `This app shows you at a glance, which foods are in season right now:`
  String get aboutPageExplanation {
    return Intl.message(
      'This app shows you at a glance, which foods are in season right now:',
      name: 'aboutPageExplanation',
      desc: 'A sentence explaining what the app does',
      args: [],
    );
  }

  /// `In season/locally or regionally available.`
  String get aboutPageAvLocal {
    return Intl.message(
      'In season/locally or regionally available.',
      name: 'aboutPageAvLocal',
      desc: 'A sentence explaining what the house icon means.',
      args: [],
    );
  }

  /// `Imported from not too far away, mostly via land transport.`
  String get aboutPageAvLand {
    return Intl.message(
      'Imported from not too far away, mostly via land transport.',
      name: 'aboutPageAvLand',
      desc: 'A sentence explaining what the truck icon means.',
      args: [],
    );
  }

  /// `Imported from far away, mostly shipped.`
  String get aboutPageAvSea {
    return Intl.message(
      'Imported from far away, mostly shipped.',
      name: 'aboutPageAvSea',
      desc: 'A sentence explaining what the ship icon means.',
      args: [],
    );
  }

  /// `Imported from far away, mostly by airplane.`
  String get aboutPageAvAir {
    return Intl.message(
      'Imported from far away, mostly by airplane.',
      name: 'aboutPageAvAir',
      desc: 'A sentence explaining what the airplane icon means.',
      args: [],
    );
  }

  /// `The colour of a name field indicates corresponds to above classification. Green is better than red.`
  String get aboutPageColors {
    return Intl.message(
      'The colour of a name field indicates corresponds to above classification. Green is better than red.',
      name: 'aboutPageColors',
      desc: 'Describes what the food background colors do',
      args: [],
    );
  }

  /// `By tapping a food's star ☆, you add it to/remove it from your favorites list. Tapping on the menu bar's star lets you restrict the view to your favorites.`
  String get aboutPageFavorites {
    return Intl.message(
      'By tapping a food\'s star ☆, you add it to/remove it from your favorites list. Tapping on the menu bar\'s star lets you restrict the view to your favorites.',
      name: 'aboutPageFavorites',
      desc: 'Describes how to use the favorites function',
      args: [],
    );
  }

  /// `Why care about foods' seasons?`
  String get aboutPageHeadline {
    return Intl.message(
      'Why care about foods\' seasons?',
      name: 'aboutPageHeadline',
      desc: 'The phrase \'Why care about foods\' seasons?\'',
      args: [],
    );
  }

  /// `Nowadays, as almost all foods are available throughout the year, people have become unconscious of the season of their foods. However, buying seasonal and local foods often has striking advantages:`
  String get aboutPageLeading {
    return Intl.message(
      'Nowadays, as almost all foods are available throughout the year, people have become unconscious of the season of their foods. However, buying seasonal and local foods often has striking advantages:',
      name: 'aboutPageLeading',
      desc: 'Justification for caring about food seasons',
      args: [],
    );
  }

  /// `Fresh produce tastes better and is healthier for your body.`
  String get aboutPageAdvantage1 {
    return Intl.message(
      'Fresh produce tastes better and is healthier for your body.',
      name: 'aboutPageAdvantage1',
      desc: 'The phrase \'Fresh produce tastes better and is healthier for your body.\'',
      args: [],
    );
  }

  /// `Fresh foods are generally cheaper.`
  String get aboutPageAdvantage2 {
    return Intl.message(
      'Fresh foods are generally cheaper.',
      name: 'aboutPageAdvantage2',
      desc: 'The phrase \'Fresh foods are generally cheaper.\'',
      args: [],
    );
  }

  /// `The efforts made for storing foods is reduced.`
  String get aboutPageAdvantage3 {
    return Intl.message(
      'The efforts made for storing foods is reduced.',
      name: 'aboutPageAdvantage3',
      desc: 'The phrase \'The efforts made for storing foods is reduced.\'',
      args: [],
    );
  }

  /// `The transport is less harmful to the environment.`
  String get aboutPageAdvantage4 {
    return Intl.message(
      'The transport is less harmful to the environment.',
      name: 'aboutPageAdvantage4',
      desc: 'The phrase \'The transport is less harmful to the environment.\'',
      args: [],
    );
  }

  /// `You support local businesses and jobs.`
  String get aboutPageAdvantage5 {
    return Intl.message(
      'You support local businesses and jobs.',
      name: 'aboutPageAdvantage5',
      desc: 'The phrase \'You support local businesses and jobs.\'',
      args: [],
    );
  }

  /// `This app lets you eat cheaper and tastier and raises the awareness for the origin of our food.`
  String get aboutPageTrailing {
    return Intl.message(
      'This app lets you eat cheaper and tastier and raises the awareness for the origin of our food.',
      name: 'aboutPageTrailing',
      desc: 'A sentence about benefits for the app user',
      args: [],
    );
  }

  /// `Please keep in mind that the actual availability of foods in your local supermarket can differ from the information shown here.`
  String get aboutPageDisclaimer {
    return Intl.message(
      'Please keep in mind that the actual availability of foods in your local supermarket can differ from the information shown here.',
      name: 'aboutPageDisclaimer',
      desc: 'A disclaimer for the availability data',
      args: [],
    );
  }

  /// `Contribute`
  String get contribPageTitle {
    return Intl.message(
      'Contribute',
      name: 'contribPageTitle',
      desc: 'The word \'Contribute\'',
      args: [],
    );
  }

  /// `Something is missing or wrong?`
  String get contribPageContactHeadline {
    return Intl.message(
      'Something is missing or wrong?',
      name: 'contribPageContactHeadline',
      desc: 'The phrase \'Something is missing or wrong?\'',
      args: [],
    );
  }

  /// `If you've found an error or room for a concrete improvement, feel free to contact me via my webpage.`
  String get contribPageContact {
    return Intl.message(
      'If you\'ve found an error or room for a concrete improvement, feel free to contact me via my webpage.',
      name: 'contribPageContact',
      desc: 'Justification for missing features/incorrectness by stating young age of app',
      args: [],
    );
  }

  /// `To the webpage`
  String get contribPageContactButtonText {
    return Intl.message(
      'To the webpage',
      name: 'contribPageContactButtonText',
      desc: 'The phrase \'To the webpage\'',
      args: [],
    );
  }

  /// `Show me the code!`
  String get contribPageCodeHeadline {
    return Intl.message(
      'Show me the code!',
      name: 'contribPageCodeHeadline',
      desc: 'The phrase \'Show me the code!\'',
      args: [],
    );
  }

  /// `The source code for the app is available on GitHub:`
  String get contribPageCode {
    return Intl.message(
      'The source code for the app is available on GitHub:',
      name: 'contribPageCode',
      desc: 'The phrase \'The source code for the app is available on GitHub:\'',
      args: [],
    );
  }

  /// `To the GitHub repo`
  String get contribPageCodeButtonText {
    return Intl.message(
      'To the GitHub repo',
      name: 'contribPageCodeButtonText',
      desc: 'The phrase \'To the GitHub repo\'',
      args: [],
    );
  }

  /// `Imprint`
  String get imprintPageTitle {
    return Intl.message(
      'Imprint',
      name: 'imprintPageTitle',
      desc: 'The word \'Imprint\'',
      args: [],
    );
  }

  /// `Publisher`
  String get imprintPagePublisher {
    return Intl.message(
      'Publisher',
      name: 'imprintPagePublisher',
      desc: 'The word \'Publisher\'',
      args: [],
    );
  }

  /// `Disclaimer`
  String get imprintPageDisclaimerHeadline {
    return Intl.message(
      'Disclaimer',
      name: 'imprintPageDisclaimerHeadline',
      desc: 'The phrase \'Disclaimer\'',
      args: [],
    );
  }

  /// `The contents of this app have been created and are provided with utmost care and in good faith. However, I make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information displayed in this app.`
  String get imprintPageDisclaimerText {
    return Intl.message(
      'The contents of this app have been created and are provided with utmost care and in good faith. However, I make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information displayed in this app.',
      name: 'imprintPageDisclaimerText',
      desc: 'The disclaimer for the app',
      args: [],
    );
  }

  /// `Privacy policy`
  String get imprintPageDataProtectionHeadline {
    return Intl.message(
      'Privacy policy',
      name: 'imprintPageDataProtectionHeadline',
      desc: 'The phrase \'Privacy policy\'',
      args: [],
    );
  }

  /// `Using this app, no personal data is collected. In order to save and load the app's settings, a permission to access the device's storage is needed.`
  String get imprintPageDataProtectionText {
    return Intl.message(
      'Using this app, no personal data is collected. In order to save and load the app\'s settings, a permission to access the device\'s storage is needed.',
      name: 'imprintPageDataProtectionText',
      desc: 'The privacy policy for the app',
      args: [],
    );
  }

  /// `Sources`
  String get imprintPageSourcesHeadline {
    return Intl.message(
      'Sources',
      name: 'imprintPageSourcesHeadline',
      desc: 'The word \'Sources\'',
      args: [],
    );
  }

  /// `App text`
  String get imprintPageTextHeadline {
    return Intl.message(
      'App text',
      name: 'imprintPageTextHeadline',
      desc: 'The word \'App text\'',
      args: [],
    );
  }

  /// `Andreas Boltres`
  String get imprintPageMyName {
    return Intl.message(
      'Andreas Boltres',
      name: 'imprintPageMyName',
      desc: 'App text author name',
      args: [],
    );
  }

  /// `Availability data`
  String get imprintPageDataHeadline {
    return Intl.message(
      'Availability data',
      name: 'imprintPageDataHeadline',
      desc: 'The phrase \'Availability data\'',
      args: [],
    );
  }

  /// `Lebensmittellexikon.de (major parts);\nAndreas Boltres (the rest).`
  String get imprintPageDataText {
    return Intl.message(
      'Lebensmittellexikon.de (major parts);\nAndreas Boltres (the rest).',
      name: 'imprintPageDataText',
      desc: 'Name of author(s) for availability data',
      args: [],
    );
  }

  /// `Credits to the team of Lebensmittellexikon.de, thanks for letting me use your availability data!`
  String get imprintPageDataText2 {
    return Intl.message(
      'Credits to the team of Lebensmittellexikon.de, thanks for letting me use your availability data!',
      name: 'imprintPageDataText2',
      desc: 'Saying thanks to those that let their data be used here',
      args: [],
    );
  }

  /// `Images`
  String get imprintPageImagesHeadline {
    return Intl.message(
      'Images',
      name: 'imprintPageImagesHeadline',
      desc: 'The word \'Images\'',
      args: [],
    );
  }

  /// `Font`
  String get imprintPageFontsHeadline {
    return Intl.message(
      'Font',
      name: 'imprintPageFontsHeadline',
      desc: 'The word \'Font\'',
      args: [],
    );
  }

  /// `Translations`
  String get imprintPageTranslationsHeadline {
    return Intl.message(
      'Translations',
      name: 'imprintPageTranslationsHeadline',
      desc: 'The word \'Translations\'',
      args: [],
    );
  }

  /// `Font Awesome 5 (apple logo, carrot logo)\n(License: fontawesome.com/license)`
  String get imprintPageFontsText {
    return Intl.message(
      'Font Awesome 5 (apple logo, carrot logo)\n(License: fontawesome.com/license)',
      name: 'imprintPageFontsText',
      desc: 'Font information',
      args: [],
    );
  }

  /// `App Information`
  String get imprintPageAppInfo {
    return Intl.message(
      'App Information',
      name: 'imprintPageAppInfo',
      desc: 'The word \'App Information\'',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: 'The word \'Settings\'',
      args: [],
    );
  }

  /// `Sort by availability`
  String get settingsSortingTitle {
    return Intl.message(
      'Sort by availability',
      name: 'settingsSortingTitle',
      desc: 'The phrase \'Sort by availability\'',
      args: [],
    );
  }

  /// `Show special and unusual foods`
  String get settingsUncommonTitle {
    return Intl.message(
      'Show special and unusual foods',
      name: 'settingsUncommonTitle',
      desc: 'The phrase \'Show special and unusual foods\'',
      args: [],
    );
  }

  /// `e.g. quince, cloudberry`
  String get settingsUncommonText {
    return Intl.message(
      'e.g. quince, cloudberry',
      name: 'settingsUncommonText',
      desc: 'The phrase \'e.g. quince, cloudberry\'',
      args: [],
    );
  }

  /// `Filter by availability`
  String get settingsFilterTitle {
    return Intl.message(
      'Filter by availability',
      name: 'settingsFilterTitle',
      desc: 'The phrase \'Filter by availability\'',
      args: [],
    );
  }

  /// `Region`
  String get settingsRegionTitle {
    return Intl.message(
      'Region',
      name: 'settingsRegionTitle',
      desc: 'The word \'Region\'',
      args: [],
    );
  }

  /// `Use device region`
  String get settingsRegionUseLocale {
    return Intl.message(
      'Use device region',
      name: 'settingsRegionUseLocale',
      desc: 'The phrase \'Use device region\'',
      args: [],
    );
  }

  /// `Uses 'Central Europe' if device region is not supported`
  String get settingsRegionUseLocaleSub {
    return Intl.message(
      'Uses \'Central Europe\' if device region is not supported',
      name: 'settingsRegionUseLocaleSub',
      desc: 'The phrase \'Uses \'Central Europe\' if device region is not supported\'',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguageTitle {
    return Intl.message(
      'Language',
      name: 'settingsLanguageTitle',
      desc: 'The word \'Language\'',
      args: [],
    );
  }

  /// `Changing the language restarts the app`
  String get settingsLanguageSubtitle {
    return Intl.message(
      'Changing the language restarts the app',
      name: 'settingsLanguageSubtitle',
      desc: 'The phrase \'Changing the language restarts the app\'',
      args: [],
    );
  }

  /// `Use device language`
  String get settingsLanguageUseLocale {
    return Intl.message(
      'Use device language',
      name: 'settingsLanguageUseLocale',
      desc: 'The phrase \'Use device language\'',
      args: [],
    );
  }

  /// `Uses English if device language is not supported`
  String get settingsLanguageUseLocaleSub {
    return Intl.message(
      'Uses English if device language is not supported',
      name: 'settingsLanguageUseLocaleSub',
      desc: 'The phrase \'Uses English if device language is not supported\'',
      args: [],
    );
  }

  /// `Version`
  String get settingsVersion {
    return Intl.message(
      'Version',
      name: 'settingsVersion',
      desc: 'The word \'Version\'',
      args: [],
    );
  }

  /// `All available foods`
  String get minAvAir {
    return Intl.message(
      'All available foods',
      name: 'minAvAir',
      desc: 'The phrase \'All available foods\'',
      args: [],
    );
  }

  /// `No foods imported via airplane`
  String get minAvSea {
    return Intl.message(
      'No foods imported via airplane',
      name: 'minAvSea',
      desc: 'The phrase \'No foods imported via airplane\'',
      args: [],
    );
  }

  /// `No foods imported from overseas/far away`
  String get minAvLand {
    return Intl.message(
      'No foods imported from overseas/far away',
      name: 'minAvLand',
      desc: 'The phrase \'No foods imported from overseas/far away\'',
      args: [],
    );
  }

  /// `Only local and regional foods`
  String get minAvLocal {
    return Intl.message(
      'Only local and regional foods',
      name: 'minAvLocal',
      desc: 'The phrase \'Only local and regional foods\'',
      args: [],
    );
  }

  /// `Support`
  String get supportPageTitle {
    return Intl.message(
      'Support',
      name: 'supportPageTitle',
      desc: 'The word \'Support\'',
      args: [],
    );
  }

  /// `Do you like the app?`
  String get supportPageSpreadTitle {
    return Intl.message(
      'Do you like the app?',
      name: 'supportPageSpreadTitle',
      desc: 'The phrase \'Do you like the app?\'',
      args: [],
    );
  }

  /// `Nice to hear that! The most effective way to support me is to simply spread the word: Let your friends and family know about the app!`
  String get supportPageSpreadText1 {
    return Intl.message(
      'Nice to hear that! The most effective way to support me is to simply spread the word: Let your friends and family know about the app!',
      name: 'supportPageSpreadText1',
      desc: 'A text motivating to spread the word about the app if the user likes it',
      args: [],
    );
  }

  /// `That way, we can raise the awareness for the origin of our foods together while also saving money and eating tastier.`
  String get supportPageSpreadText2 {
    return Intl.message(
      'That way, we can raise the awareness for the origin of our foods together while also saving money and eating tastier.',
      name: 'supportPageSpreadText2',
      desc: 'Continuation of the motivating text',
      args: [],
    );
  }

  /// `Give alms`
  String get supportPageHeadline {
    return Intl.message(
      'Give alms',
      name: 'supportPageHeadline',
      desc: 'The word \'Give alms\'',
      args: [],
    );
  }

  /// `This app will remain fully free of charge and ad-free as long as I am developing it.`
  String get supportPageText1 {
    return Intl.message(
      'This app will remain fully free of charge and ad-free as long as I am developing it.',
      name: 'supportPageText1',
      desc: 'The statement \'This app will remain fully free of charge and ad-free as long as I am developing it.\'',
      args: [],
    );
  }

  /// `But if you'd like to support my work, you can have a look at what I do in general at my webpage.`
  String get supportPageText2 {
    return Intl.message(
      'But if you\'d like to support my work, you can have a look at what I do in general at my webpage.',
      name: 'supportPageText2',
      desc: 'Something like \'User can go to webpage if they further want to support\'',
      args: [],
    );
  }

  /// `To the webpage`
  String get supportPageWebsiteLink {
    return Intl.message(
      'To the webpage',
      name: 'supportPageWebsiteLink',
      desc: 'The phrase \'To the webpage\'',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: 'The word \'Back\'',
      args: [],
    );
  }

  /// `Wikipedia`
  String get wikipedia {
    return Intl.message(
      'Wikipedia',
      name: 'wikipedia',
      desc: 'The word \'Wikipedia\'',
      args: [],
    );
  }

  /// `License: `
  String get imprintImgSourcesLicense {
    return Intl.message(
      'License: ',
      name: 'imprintImgSourcesLicense',
      desc: 'The word \'License: \' (with trailing double dot and space!)',
      args: [],
    );
  }

  /// `\nCreator: `
  String get imprintImgSourcesPublisher {
    return Intl.message(
      '\nCreator: ',
      name: 'imprintImgSourcesPublisher',
      desc: 'The word \'Creator: \' (with trailing double dot and space, leading newline!)',
      args: [],
    );
  }

  /// `No foods available!`
  String get emptyFoodsViewText {
    return Intl.message(
      'No foods available!',
      name: 'emptyFoodsViewText',
      desc: 'A text shown when no food is displayed in the current foods view.',
      args: [],
    );
  }

  /// `No favorites available!`
  String get emptyFavoritesViewText {
    return Intl.message(
      'No favorites available!',
      name: 'emptyFavoritesViewText',
      desc: 'A text shown when no favorites are displayed in the current foods view.',
      args: [],
    );
  }

  /// `Add a favorite by tapping the food's star ☆.`
  String get emptyFavoritesViewHint {
    return Intl.message(
      'Add a favorite by tapping the food\'s star ☆.',
      name: 'emptyFavoritesViewHint',
      desc: 'A hint shown when no favorites are displayed in the current foods view.',
      args: [],
    );
  }

  /// `Check your foods display filtering.`
  String get emptyDefaultViewHint {
    return Intl.message(
      'Check your foods display filtering.',
      name: 'emptyDefaultViewHint',
      desc: 'A hint shown when no foods are displayed in the current default foods view.',
      args: [],
    );
  }

  /// `No foods found!`
  String get emptySearchViewText {
    return Intl.message(
      'No foods found!',
      name: 'emptySearchViewText',
      desc: 'A text shown when no food is displayed in the search result view.',
      args: [],
    );
  }

  /// `Search...`
  String get searchFieldLabel {
    return Intl.message(
      'Search...',
      name: 'searchFieldLabel',
      desc: 'The label used in the search bar',
      args: [],
    );
  }

  /// `About the app`
  String get etcPageTitle {
    return Intl.message(
      'About the app',
      name: 'etcPageTitle',
      desc: 'Title shown at the top of the \'more info\' page (the one behind the icon with three dots)',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}