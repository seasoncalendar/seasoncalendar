// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

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

  /// `Please keep in mind that the actual availability of foods in your local supermarket can differ from the information shown here.`
  String get aboutPageDisclaimer {
    return Intl.message(
      'Please keep in mind that the actual availability of foods in your local supermarket can differ from the information shown here.',
      name: 'aboutPageDisclaimer',
      desc: 'A disclaimer for the availability data',
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

  /// `About the app`
  String get aboutPageTitle {
    return Intl.message(
      'About the app',
      name: 'aboutPageTitle',
      desc: 'The phrase \'About the app\'',
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

  /// `https://en.wikipedia.org/wiki/Phyllanthus_emblica`
  String get amla_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Phyllanthus_emblica',
      name: 'amla_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Amla, Emblic, Myrobalan, Indian gooseberry`
  String get amla_names {
    return Intl.message(
      'Amla, Emblic, Myrobalan, Indian gooseberry',
      name: 'amla_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Apple`
  String get apple_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Apple',
      name: 'apple_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple_names {
    return Intl.message(
      'Apple',
      name: 'apple_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Prunus_armeniaca`
  String get apricot_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Prunus_armeniaca',
      name: 'apricot_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Apricot`
  String get apricot_names {
    return Intl.message(
      'Apricot',
      name: 'apricot_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Artichoke`
  String get artichoke_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Artichoke',
      name: 'artichoke_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Artichoke`
  String get artichoke_names {
    return Intl.message(
      'Artichoke',
      name: 'artichoke_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Asparagus`
  String get asparagus_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Asparagus',
      name: 'asparagus_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Asparagus, Sparrow grass`
  String get asparagus_names {
    return Intl.message(
      'Asparagus, Sparrow grass',
      name: 'asparagus_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Avocado`
  String get avocado_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Avocado',
      name: 'avocado_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Avocado, Avocado Pear, Alligator pear`
  String get avocado_names {
    return Intl.message(
      'Avocado, Avocado Pear, Alligator pear',
      name: 'avocado_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Banana`
  String get banana_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Banana',
      name: 'banana_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Banana`
  String get banana_names {
    return Intl.message(
      'Banana',
      name: 'banana_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lettuce`
  String get batavia_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lettuce',
      name: 'batavia_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Batavia, Salad, Lettuce`
  String get batavia_names {
    return Intl.message(
      'Batavia, Salad, Lettuce',
      name: 'batavia_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Beetroot`
  String get beetroot_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Beetroot',
      name: 'beetroot_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Beetroot, beets, table beet, red beet`
  String get beetroot_names {
    return Intl.message(
      'Beetroot, beets, table beet, red beet',
      name: 'beetroot_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Blackberry`
  String get blackberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Blackberry',
      name: 'blackberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Blackberry`
  String get blackberry_names {
    return Intl.message(
      'Blackberry',
      name: 'blackberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Bilberry`
  String get blueberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Bilberry',
      name: 'blueberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Blueberry`
  String get blueberry_names {
    return Intl.message(
      'Blueberry',
      name: 'blueberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Broccoli`
  String get broccoli_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Broccoli',
      name: 'broccoli_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Broccoli`
  String get broccoli_names {
    return Intl.message(
      'Broccoli',
      name: 'broccoli_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Brussels_sprout`
  String get brusselssprouts_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Brussels_sprout',
      name: 'brusselssprouts_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Brussels sprout`
  String get brusselssprouts_names {
    return Intl.message(
      'Brussels sprout',
      name: 'brusselssprouts_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Carob`
  String get carob_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Carob',
      name: 'carob_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Carob`
  String get carob_names {
    return Intl.message(
      'Carob',
      name: 'carob_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Carrot`
  String get carrot_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Carrot',
      name: 'carrot_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Carrot`
  String get carrot_names {
    return Intl.message(
      'Carrot',
      name: 'carrot_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Cauliflower`
  String get cauliflower_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Cauliflower',
      name: 'cauliflower_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cauliflower`
  String get cauliflower_names {
    return Intl.message(
      'Cauliflower',
      name: 'cauliflower_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Celery`
  String get celerygreen_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Celery',
      name: 'celerygreen_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Celery`
  String get celerygreen_names {
    return Intl.message(
      'Celery',
      name: 'celerygreen_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Celeriac`
  String get celery_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Celeriac',
      name: 'celery_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Celeriac, Knob celery, Celery root`
  String get celery_names {
    return Intl.message(
      'Celeriac, Knob celery, Celery root',
      name: 'celery_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Agaricus_bisporus`
  String get champignon_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Agaricus_bisporus',
      name: 'champignon_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Champignon, Mushroom`
  String get champignon_names {
    return Intl.message(
      'Champignon, Mushroom',
      name: 'champignon_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Chard`
  String get chard_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Chard',
      name: 'chard_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Chard, swiss chard`
  String get chard_names {
    return Intl.message(
      'Chard, swiss chard',
      name: 'chard_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Prunus_avium`
  String get cherry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Prunus_avium',
      name: 'cherry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cherry, Sweet Cherry, Wild Cherry, Gean`
  String get cherry_names {
    return Intl.message(
      'Cherry, Sweet Cherry, Wild Cherry, Gean',
      name: 'cherry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Castanea_sativa`
  String get chestnut_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Castanea_sativa',
      name: 'chestnut_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Chestnut, Castanea sativa`
  String get chestnut_names {
    return Intl.message(
      'Chestnut, Castanea sativa',
      name: 'chestnut_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Chicory#Cultivated`
  String get chicory_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Chicory#Cultivated',
      name: 'chicory_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Chicory`
  String get chicory_names {
    return Intl.message(
      'Chicory',
      name: 'chicory_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Napa_cabbage`
  String get chinesecabbage_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Napa_cabbage',
      name: 'chinesecabbage_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Chinese cabbage, Napa cabbage, Napa`
  String get chinesecabbage_names {
    return Intl.message(
      'Chinese cabbage, Napa cabbage, Napa',
      name: 'chinesecabbage_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Clementine`
  String get clementine_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Clementine',
      name: 'clementine_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Clementine, Mandarin orange, Tangor, Tangerine`
  String get clementine_names {
    return Intl.message(
      'Clementine, Mandarin orange, Tangor, Tangerine',
      name: 'clementine_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Rubus_chamaemorus`
  String get cloudberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Rubus_chamaemorus',
      name: 'cloudberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cloudberry, Nordic berry, Bakeapple, Knotberry, Knoutberry, Aqpik, Averin, Evron`
  String get cloudberry_names {
    return Intl.message(
      'Cloudberry, Nordic berry, Bakeapple, Knotberry, Knoutberry, Aqpik, Averin, Evron',
      name: 'cloudberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Coconut`
  String get coco_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Coconut',
      name: 'coco_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Coconut, Coco`
  String get coco_names {
    return Intl.message(
      'Coconut, Coco',
      name: 'coco_names',
      desc: '',
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

  /// `Show me the code!`
  String get contribPageCodeHeadline {
    return Intl.message(
      'Show me the code!',
      name: 'contribPageCodeHeadline',
      desc: 'The phrase \'Show me the code!\'',
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

  /// `Something is missing or wrong?`
  String get contribPageContactHeadline {
    return Intl.message(
      'Something is missing or wrong?',
      name: 'contribPageContactHeadline',
      desc: 'The phrase \'Something is missing or wrong?\'',
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

  /// `https://en.wikipedia.org/wiki/Cranberry`
  String get cranberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Cranberry',
      name: 'cranberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cranberry`
  String get cranberry_names {
    return Intl.message(
      'Cranberry',
      name: 'cranberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Cucumber`
  String get cucumber_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Cucumber',
      name: 'cucumber_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cucumber`
  String get cucumber_names {
    return Intl.message(
      'Cucumber',
      name: 'cucumber_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Ribes`
  String get currant_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Ribes',
      name: 'currant_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Currant, Ribes`
  String get currant_names {
    return Intl.message(
      'Currant, Ribes',
      name: 'currant_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Date_palm`
  String get date_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Date_palm',
      name: 'date_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Fresh date, Date`
  String get date_names {
    return Intl.message(
      'Fresh date, Date',
      name: 'date_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Pitaya`
  String get dragonfruit_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pitaya',
      name: 'dragonfruit_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Dragonfruit, Pitaya, Pitahaya`
  String get dragonfruit_names {
    return Intl.message(
      'Dragonfruit, Pitaya, Pitahaya',
      name: 'dragonfruit_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Eggplant`
  String get eggplant_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Eggplant',
      name: 'eggplant_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Eggplant, Aubergine, Brinjal`
  String get eggplant_names {
    return Intl.message(
      'Eggplant, Aubergine, Brinjal',
      name: 'eggplant_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Sambucus_nigra`
  String get elderberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Sambucus_nigra',
      name: 'elderberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Elderberry, sambucus, elder`
  String get elderberry_names {
    return Intl.message(
      'Elderberry, sambucus, elder',
      name: 'elderberry_names',
      desc: '',
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

  /// `Add a favorite by tapping the food's star ☆.`
  String get emptyFavoritesViewHint {
    return Intl.message(
      'Add a favorite by tapping the food\'s star ☆.',
      name: 'emptyFavoritesViewHint',
      desc: 'A hint shown when no favorites are displayed in the current foods view.',
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

  /// `No foods available!`
  String get emptyFoodsViewText {
    return Intl.message(
      'No foods available!',
      name: 'emptyFoodsViewText',
      desc: 'A text shown when no food is displayed in the current foods view.',
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

  /// `https://en.wikipedia.org/wiki/Endive`
  String get endive_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Endive',
      name: 'endive_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Endive, Salad`
  String get endive_names {
    return Intl.message(
      'Endive, Salad',
      name: 'endive_names',
      desc: '',
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

  /// `February`
  String get february {
    return Intl.message(
      'February',
      name: 'february',
      desc: 'The word \'February\'',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Fennel`
  String get fennel_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Fennel',
      name: 'fennel_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Fennel`
  String get fennel_names {
    return Intl.message(
      'Fennel',
      name: 'fennel_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Valerianella_locusta`
  String get fieldsalad_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Valerianella_locusta',
      name: 'fieldsalad_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Field salad, Corn salad, Lamb's lettuce, Fetticus, Nut lettuce, Salad, Lettuce`
  String get fieldsalad_names {
    return Intl.message(
      'Field salad, Corn salad, Lamb\'s lettuce, Fetticus, Nut lettuce, Salad, Lettuce',
      name: 'fieldsalad_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Common_fig`
  String get fig_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Common_fig',
      name: 'fig_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Fig`
  String get fig_names {
    return Intl.message(
      'Fig',
      name: 'fig_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Gooseberry`
  String get gooseberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Gooseberry',
      name: 'gooseberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Gooseberry`
  String get gooseberry_names {
    return Intl.message(
      'Gooseberry',
      name: 'gooseberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Grapefruit`
  String get grapefuit_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Grapefruit',
      name: 'grapefuit_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Grapefruit`
  String get grapefuit_names {
    return Intl.message(
      'Grapefruit',
      name: 'grapefuit_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Grape`
  String get grapes_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Grape',
      name: 'grapes_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Grapes, Wine grape`
  String get grapes_names {
    return Intl.message(
      'Grapes, Wine grape',
      name: 'grapes_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Phaseolus_vulgaris`
  String get greenbeans_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Phaseolus_vulgaris',
      name: 'greenbeans_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Common bean, Green beans, French bean`
  String get greenbeans_names {
    return Intl.message(
      'Common bean, Green beans, French bean',
      name: 'greenbeans_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Kale`
  String get greencabbage_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Kale',
      name: 'greencabbage_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Kale, Green cabbage, Cabbage, Leaf cabbage`
  String get greencabbage_names {
    return Intl.message(
      'Kale, Green cabbage, Cabbage, Leaf cabbage',
      name: 'greencabbage_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Allium_fistulosum`
  String get greenonion_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Allium_fistulosum',
      name: 'greenonion_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Green onions, Onion, Welsh onion, Bunching onion, spring onion`
  String get greenonion_names {
    return Intl.message(
      'Green onions, Onion, Welsh onion, Bunching onion, spring onion',
      name: 'greenonion_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Psidium_guajava`
  String get guava_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Psidium_guajava',
      name: 'guava_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Guava, Psidium Guajava`
  String get guava_names {
    return Intl.message(
      'Guava, Psidium Guajava',
      name: 'guava_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lettuce`
  String get headlettuce_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lettuce',
      name: 'headlettuce_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Head lettuce, Lettuce, Salad, Butterhead, Boston, Bibb lettuce`
  String get headlettuce_names {
    return Intl.message(
      'Head lettuce, Lettuce, Salad, Butterhead, Boston, Bibb lettuce',
      name: 'headlettuce_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Muskmelon`
  String get honeymelon_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Muskmelon',
      name: 'honeymelon_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Muskmelon, Honey melons, galia melon, cantaloupe melon`
  String get honeymelon_names {
    return Intl.message(
      'Muskmelon, Honey melons, galia melon, cantaloupe melon',
      name: 'honeymelon_names',
      desc: '',
      args: [],
    );
  }

  /// `Imported from far away, mostly by airplane.`
  String get howToPageAvAir {
    return Intl.message(
      'Imported from far away, mostly by airplane.',
      name: 'howToPageAvAir',
      desc: 'A sentence explaining what the airplane icon means.',
      args: [],
    );
  }

  /// `Imported from not too far away, mostly via land transport.`
  String get howToPageAvLand {
    return Intl.message(
      'Imported from not too far away, mostly via land transport.',
      name: 'howToPageAvLand',
      desc: 'A sentence explaining what the truck icon means.',
      args: [],
    );
  }

  /// `In season/locally or regionally available.`
  String get howToPageAvLocal {
    return Intl.message(
      'In season/locally or regionally available.',
      name: 'howToPageAvLocal',
      desc: 'A sentence explaining what the house icon means.',
      args: [],
    );
  }

  /// `Imported from far away, mostly shipped.`
  String get howToPageAvSea {
    return Intl.message(
      'Imported from far away, mostly shipped.',
      name: 'howToPageAvSea',
      desc: 'A sentence explaining what the ship icon means.',
      args: [],
    );
  }

  /// `The colour of a name field indicates corresponds to above classification. Green is better than red.`
  String get howToPageColors {
    return Intl.message(
      'The colour of a name field indicates corresponds to above classification. Green is better than red.',
      name: 'howToPageColors',
      desc: 'Describes what the food background colors do',
      args: [],
    );
  }

  /// `This app shows you at a glance, which foods are in season right now:`
  String get howToPageExplanation {
    return Intl.message(
      'This app shows you at a glance, which foods are in season right now:',
      name: 'howToPageExplanation',
      desc: 'A sentence explaining what the app does',
      args: [],
    );
  }

  /// `How do I use the app?`
  String get howToPageExplanationHeadline {
    return Intl.message(
      'How do I use the app?',
      name: 'howToPageExplanationHeadline',
      desc: 'The phrase \'How do I use the app?\'',
      args: [],
    );
  }

  /// `By tapping a food's star ☆, you add it to/remove it from your favorites list. Tapping on the menu bar's star lets you restrict the view to your favorites.`
  String get howToPageFavorites {
    return Intl.message(
      'By tapping a food\'s star ☆, you add it to/remove it from your favorites list. Tapping on the menu bar\'s star lets you restrict the view to your favorites.',
      name: 'howToPageFavorites',
      desc: 'Describes how to use the favorites function',
      args: [],
    );
  }

  /// `A black icon indicates abundant availability, a gray icon limited availability from that specific category.`
  String get howToPagePartial {
    return Intl.message(
      'A black icon indicates abundant availability, a gray icon limited availability from that specific category.',
      name: 'howToPagePartial',
      desc: 'Describes what the icon\'s color does.',
      args: [],
    );
  }

  /// `Explanation`
  String get howToPageTitle {
    return Intl.message(
      'Explanation',
      name: 'howToPageTitle',
      desc: 'The word \'Explanation\'',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lettuce`
  String get iceberg_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lettuce',
      name: 'iceberg_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Iceberg salad, Crisphead, Salad, Lettuce`
  String get iceberg_names {
    return Intl.message(
      'Iceberg salad, Crisphead, Salad, Lettuce',
      name: 'iceberg_names',
      desc: '',
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

  /// `App Information`
  String get imprintPageAppInfo {
    return Intl.message(
      'App Information',
      name: 'imprintPageAppInfo',
      desc: 'The word \'App Information\'',
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

  /// `Availability data`
  String get imprintPageDataHeadline {
    return Intl.message(
      'Availability data',
      name: 'imprintPageDataHeadline',
      desc: 'The phrase \'Availability data\'',
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

  /// `Font`
  String get imprintPageFontsHeadline {
    return Intl.message(
      'Font',
      name: 'imprintPageFontsHeadline',
      desc: 'The word \'Font\'',
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

  /// `Images`
  String get imprintPageImagesHeadline {
    return Intl.message(
      'Images',
      name: 'imprintPageImagesHeadline',
      desc: 'The word \'Images\'',
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

  /// `Publisher`
  String get imprintPagePublisher {
    return Intl.message(
      'Publisher',
      name: 'imprintPagePublisher',
      desc: 'The word \'Publisher\'',
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

  /// `Imprint`
  String get imprintPageTitle {
    return Intl.message(
      'Imprint',
      name: 'imprintPageTitle',
      desc: 'The word \'Imprint\'',
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

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: 'The word \'January\'',
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

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: 'The word \'June\'',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Kiwifruit`
  String get kiwi_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Kiwifruit',
      name: 'kiwi_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Kiwi, Kiwifruit`
  String get kiwi_names {
    return Intl.message(
      'Kiwi, Kiwifruit',
      name: 'kiwi_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Kohlrabi`
  String get kohlrabi_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Kohlrabi',
      name: 'kohlrabi_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Kohlrabi`
  String get kohlrabi_names {
    return Intl.message(
      'Kohlrabi',
      name: 'kohlrabi_names',
      desc: '',
      args: [],
    );
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

  /// `English`
  String get languageName {
    return Intl.message(
      'English',
      name: 'languageName',
      desc: 'The name of this language',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Leek`
  String get leek_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Leek',
      name: 'leek_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Leek`
  String get leek_names {
    return Intl.message(
      'Leek',
      name: 'leek_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lemon`
  String get lemon_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lemon',
      name: 'lemon_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Lemon`
  String get lemon_names {
    return Intl.message(
      'Lemon',
      name: 'lemon_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lime_(fruit)`
  String get lime_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lime_(fruit)',
      name: 'lime_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Lime`
  String get lime_names {
    return Intl.message(
      'Lime',
      name: 'lime_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Vaccinium_vitis-idaea`
  String get lingonberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Vaccinium_vitis-idaea',
      name: 'lingonberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Lingonberry, Patridgeberry, Cowberry, Mountain cranberry`
  String get lingonberry_names {
    return Intl.message(
      'Lingonberry, Patridgeberry, Cowberry, Mountain cranberry',
      name: 'lingonberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lettuce`
  String get lollorossa_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lettuce',
      name: 'lollorossa_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Lollo rossa, Lettuce`
  String get lollorossa_names {
    return Intl.message(
      'Lollo rossa, Lettuce',
      name: 'lollorossa_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Lychee`
  String get lychee_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Lychee',
      name: 'lychee_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Lychee, Longan, Litchi`
  String get lychee_names {
    return Intl.message(
      'Lychee, Longan, Litchi',
      name: 'lychee_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Mango`
  String get mango_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Mango',
      name: 'mango_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Mango`
  String get mango_names {
    return Intl.message(
      'Mango',
      name: 'mango_names',
      desc: '',
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

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: 'The word \'May\'',
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

  /// `No foods imported via airplane`
  String get minAvSea {
    return Intl.message(
      'No foods imported via airplane',
      name: 'minAvSea',
      desc: 'The phrase \'No foods imported via airplane\'',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pyrus_pyrifolia`
  String get nashi_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pyrus_pyrifolia',
      name: 'nashi_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Nashi pear, Asian pear, Japanese pear, Chinese pear, Korean pear, Apple pear, Taiwanese pear, Papple`
  String get nashi_names {
    return Intl.message(
      'Nashi pear, Asian pear, Japanese pear, Chinese pear, Korean pear, Apple pear, Taiwanese pear, Papple',
      name: 'nashi_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Peach#Nectarines`
  String get nectarine_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Peach#Nectarines',
      name: 'nectarine_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Nectarine`
  String get nectarine_names {
    return Intl.message(
      'Nectarine',
      name: 'nectarine_names',
      desc: '',
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

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: 'The word \'October\'',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Onion`
  String get onion_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Onion',
      name: 'onion_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Onion, Bulb onion, Common onion, Cepa, Shallot`
  String get onion_names {
    return Intl.message(
      'Onion, Bulb onion, Common onion, Cepa, Shallot',
      name: 'onion_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Orange_(fruit)`
  String get orange_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Orange_(fruit)',
      name: 'orange_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Orange, Sweet orange`
  String get orange_names {
    return Intl.message(
      'Orange, Sweet orange',
      name: 'orange_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Bok_choy`
  String get pakchoi_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Bok_choy',
      name: 'pakchoi_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Bok Choy, pak choi, Pok choi`
  String get pakchoi_names {
    return Intl.message(
      'Bok Choy, pak choi, Pok choi',
      name: 'pakchoi_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Papaya`
  String get papaya_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Papaya',
      name: 'papaya_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Papaya, Papaw, Pawpaw`
  String get papaya_names {
    return Intl.message(
      'Papaya, Papaw, Pawpaw',
      name: 'papaya_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Bell_pepper`
  String get paprika_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Bell_pepper',
      name: 'paprika_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Paprika, Pepper, Sweet pepper, Bell pepper, Capsicum`
  String get paprika_names {
    return Intl.message(
      'Paprika, Pepper, Sweet pepper, Bell pepper, Capsicum',
      name: 'paprika_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Parsnip`
  String get parsnip_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Parsnip',
      name: 'parsnip_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Parsnip`
  String get parsnip_names {
    return Intl.message(
      'Parsnip',
      name: 'parsnip_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Passiflora_edulis`
  String get passionfruit_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Passiflora_edulis',
      name: 'passionfruit_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Passion fruit, Maracuja, Passiflora edulis`
  String get passionfruit_names {
    return Intl.message(
      'Passion fruit, Maracuja, Passiflora edulis',
      name: 'passionfruit_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Peach`
  String get peach_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Peach',
      name: 'peach_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Peach`
  String get peach_names {
    return Intl.message(
      'Peach',
      name: 'peach_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pear`
  String get pear_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pear',
      name: 'pear_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Pear`
  String get pear_names {
    return Intl.message(
      'Pear',
      name: 'pear_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pea`
  String get peas_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pea',
      name: 'peas_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Peas, Pea`
  String get peas_names {
    return Intl.message(
      'Peas, Pea',
      name: 'peas_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Diospyros_kaki`
  String get persimmon_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Diospyros_kaki',
      name: 'persimmon_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Persimmon, Diospyros Kaki, Kaki`
  String get persimmon_names {
    return Intl.message(
      'Persimmon, Diospyros Kaki, Kaki',
      name: 'persimmon_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Physalis`
  String get physalis_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Physalis',
      name: 'physalis_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Physalis, Groundcherry, Inca berry, Cape gooseberry`
  String get physalis_names {
    return Intl.message(
      'Physalis, Groundcherry, Inca berry, Cape gooseberry',
      name: 'physalis_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pineapple`
  String get pineapple_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pineapple',
      name: 'pineapple_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple, Ananas`
  String get pineapple_names {
    return Intl.message(
      'Pineapple, Ananas',
      name: 'pineapple_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Prunus_domestica`
  String get plum_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Prunus_domestica',
      name: 'plum_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Plum, European Plum`
  String get plum_names {
    return Intl.message(
      'Plum, European Plum',
      name: 'plum_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Cabbage`
  String get pointedcabbage_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Cabbage',
      name: 'pointedcabbage_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Pointed cabbage, Cabbage`
  String get pointedcabbage_names {
    return Intl.message(
      'Pointed cabbage, Cabbage',
      name: 'pointedcabbage_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pomegranate`
  String get pomegranate_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pomegranate',
      name: 'pomegranate_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Pomegranate`
  String get pomegranate_names {
    return Intl.message(
      'Pomegranate',
      name: 'pomegranate_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Potato`
  String get potato_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Potato',
      name: 'potato_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Potato`
  String get potato_names {
    return Intl.message(
      'Potato',
      name: 'potato_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Opuntia_ficus-indica`
  String get pricklypear_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Opuntia_ficus-indica',
      name: 'pricklypear_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Prickly pear`
  String get pricklypear_names {
    return Intl.message(
      'Prickly pear',
      name: 'pricklypear_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Zwetschge`
  String get prune_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Zwetschge',
      name: 'prune_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Zwetschge, Sugar Plum, Prune`
  String get prune_names {
    return Intl.message(
      'Zwetschge, Sugar Plum, Prune',
      name: 'prune_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Pumpkin`
  String get pumpkin_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Pumpkin',
      name: 'pumpkin_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Pumpkins`
  String get pumpkin_names {
    return Intl.message(
      'Pumpkins',
      name: 'pumpkin_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Red_cabbage`
  String get purplecabbage_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Red_cabbage',
      name: 'purplecabbage_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Red cabbage, purple cabbage, Blaukraut, Cabbage`
  String get purplecabbage_names {
    return Intl.message(
      'Red cabbage, purple cabbage, Blaukraut, Cabbage',
      name: 'purplecabbage_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Quince`
  String get quince_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Quince',
      name: 'quince_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Quince`
  String get quince_names {
    return Intl.message(
      'Quince',
      name: 'quince_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Radicchio`
  String get radicchio_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Radicchio',
      name: 'radicchio_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Radicchio, Italian chicory`
  String get radicchio_names {
    return Intl.message(
      'Radicchio, Italian chicory',
      name: 'radicchio_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Raphanus`
  String get radish_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Raphanus',
      name: 'radish_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Raphanus`
  String get radish_names {
    return Intl.message(
      'Raphanus',
      name: 'radish_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Raspberry`
  String get raspberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Raspberry',
      name: 'raspberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Raspberry`
  String get raspberry_names {
    return Intl.message(
      'Raspberry',
      name: 'raspberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Rhubarb`
  String get rhubarb_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Rhubarb',
      name: 'rhubarb_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Rhubarb`
  String get rhubarb_names {
    return Intl.message(
      'Rhubarb',
      name: 'rhubarb_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Rose_hip`
  String get rosehip_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Rose_hip',
      name: 'rosehip_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Rosehip, Rose hip, Rose haw, Rose hep`
  String get rosehip_names {
    return Intl.message(
      'Rosehip, Rose hip, Rose haw, Rose hep',
      name: 'rosehip_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Savoy_cabbage`
  String get savoy_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Savoy_cabbage',
      name: 'savoy_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Savoy, Savoy cabbage, Cabbage`
  String get savoy_names {
    return Intl.message(
      'Savoy, Savoy cabbage, Cabbage',
      name: 'savoy_names',
      desc: '',
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

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: 'The word \'September\'',
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

  /// `Changing the language restarts the app`
  String get settingsLanguageSubtitle {
    return Intl.message(
      'Changing the language restarts the app',
      name: 'settingsLanguageSubtitle',
      desc: 'The phrase \'Changing the language restarts the app\'',
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

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: 'The word \'Settings\'',
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

  /// `Sort by availability`
  String get settingsSortingTitle {
    return Intl.message(
      'Sort by availability',
      name: 'settingsSortingTitle',
      desc: 'The phrase \'Sort by availability\'',
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

  /// `Show special and unusual foods`
  String get settingsUncommonTitle {
    return Intl.message(
      'Show special and unusual foods',
      name: 'settingsUncommonTitle',
      desc: 'The phrase \'Show special and unusual foods\'',
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

  /// `https://en.wikipedia.org/wiki/Radish`
  String get smallradish_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Radish',
      name: 'smallradish_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Radish, small radish`
  String get smallradish_names {
    return Intl.message(
      'Radish, small radish',
      name: 'smallradish_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Sorbus_aucuparia`
  String get sorb_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Sorbus_aucuparia',
      name: 'sorb_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Sorb, Rowan`
  String get sorb_names {
    return Intl.message(
      'Sorb, Rowan',
      name: 'sorb_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Spinach`
  String get spinach_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Spinach',
      name: 'spinach_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Spinach`
  String get spinach_names {
    return Intl.message(
      'Spinach',
      name: 'spinach_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Carambola`
  String get starfuit_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Carambola',
      name: 'starfuit_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Carambola, Star fruit`
  String get starfuit_names {
    return Intl.message(
      'Carambola, Star fruit',
      name: 'starfuit_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Strawberry`
  String get strawberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Strawberry',
      name: 'strawberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry`
  String get strawberry_names {
    return Intl.message(
      'Strawberry',
      name: 'strawberry_names',
      desc: '',
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

  /// `Do you like the app?`
  String get supportPageSpreadTitle {
    return Intl.message(
      'Do you like the app?',
      name: 'supportPageSpreadTitle',
      desc: 'The phrase \'Do you like the app?\'',
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

  /// `Support`
  String get supportPageTitle {
    return Intl.message(
      'Support',
      name: 'supportPageTitle',
      desc: 'The word \'Support\'',
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

  /// `https://en.wikipedia.org/wiki/Maize`
  String get sweetcorn_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Maize',
      name: 'sweetcorn_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Corn, Sweet Corn, Maize`
  String get sweetcorn_names {
    return Intl.message(
      'Corn, Sweet Corn, Maize',
      name: 'sweetcorn_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Sweet_potato`
  String get sweetpotato_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Sweet_potato',
      name: 'sweetpotato_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Sweet potato, Sweetpotato`
  String get sweetpotato_names {
    return Intl.message(
      'Sweet potato, Sweetpotato',
      name: 'sweetpotato_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Tomato`
  String get tomato_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Tomato',
      name: 'tomato_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Tomato`
  String get tomato_names {
    return Intl.message(
      'Tomato',
      name: 'tomato_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Watermelon`
  String get watermelon_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Watermelon',
      name: 'watermelon_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Watermelon, Water melon`
  String get watermelon_names {
    return Intl.message(
      'Watermelon, Water melon',
      name: 'watermelon_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Cabbage`
  String get whitecabbage_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Cabbage',
      name: 'whitecabbage_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `White cabbage, Cabbage`
  String get whitecabbage_names {
    return Intl.message(
      'White cabbage, Cabbage',
      name: 'whitecabbage_names',
      desc: '',
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

  /// `https://en.wikipedia.org/wiki/Fragaria_vesca`
  String get wildstrawberry_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Fragaria_vesca',
      name: 'wildstrawberry_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Wild strawberry, Fraisier des bois, Woodland Strawberry`
  String get wildstrawberry_names {
    return Intl.message(
      'Wild strawberry, Fraisier des bois, Woodland Strawberry',
      name: 'wildstrawberry_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Mirabelle_plum`
  String get yellowplum_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Mirabelle_plum',
      name: 'yellowplum_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Yellow plum, Mirabelle plum, Mirabelle prune, Cherry Plum`
  String get yellowplum_names {
    return Intl.message(
      'Yellow plum, Mirabelle plum, Mirabelle prune, Cherry Plum',
      name: 'yellowplum_names',
      desc: '',
      args: [],
    );
  }

  /// `https://en.wikipedia.org/wiki/Zucchini`
  String get zucchini_infoUrl {
    return Intl.message(
      'https://en.wikipedia.org/wiki/Zucchini',
      name: 'zucchini_infoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Zucchini, Courgette, Baby marrow`
  String get zucchini_names {
    return Intl.message(
      'Zucchini, Courgette, Baby marrow',
      name: 'zucchini_names',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bg'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'nb', countryCode: 'NO'),
      Locale.fromSubtags(languageCode: 'pl'),
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