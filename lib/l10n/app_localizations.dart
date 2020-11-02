
import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.1
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : assert(locale != null), localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  // The title of the app, e.g. 'Seasonal foods calendar'
  String get appTitle;

  // The word 'January'
  String get january;

  // The word 'February'
  String get february;

  // The word 'March'
  String get march;

  // The word 'April'
  String get april;

  // The word 'May'
  String get may;

  // The word 'June'
  String get june;

  // The word 'July'
  String get july;

  // The word 'August'
  String get august;

  // The word 'September'
  String get september;

  // The word 'October'
  String get october;

  // The word 'November'
  String get november;

  // The word 'December'
  String get december;

  // The word 'Imprint'
  String get imprintPageButtonText;

  // The word 'Explanation'
  String get aboutPageTitle;

  // The phrase 'How do I use the app?'
  String get aboutPageExplanationHeadline;

  // A sentence explaining what the app does
  String get aboutPageExplanation;

  // A sentence explaining what the house icon means.
  String get aboutPageAvLocal;

  // A sentence explaining what the truck icon means.
  String get aboutPageAvLand;

  // A sentence explaining what the ship icon means.
  String get aboutPageAvSea;

  // A sentence explaining what the airplane icon means.
  String get aboutPageAvAir;

  // Describes what the food background colors do
  String get aboutPageColors;

  // Describes how to use the favorites function
  String get aboutPageFavorites;

  // The phrase 'Why care about foods' seasons?'
  String get aboutPageHeadline;

  // Justification for caring about food seasons
  String get aboutPageLeading;

  // The phrase 'Fresh produce tastes better and is healthier for your body.'
  String get aboutPageAdvantage1;

  // The phrase 'Fresh foods are generally cheaper.'
  String get aboutPageAdvantage2;

  // The phrase 'The efforts made for storing foods is reduced.'
  String get aboutPageAdvantage3;

  // The phrase 'The transport is less harmful to the environment.'
  String get aboutPageAdvantage4;

  // The phrase 'You support local businesses and jobs.'
  String get aboutPageAdvantage5;

  // A sentence about benefits for the app user
  String get aboutPageTrailing;

  // A disclaimer for the availability data
  String get aboutPageDisclaimer;

  // The word 'Contribute'
  String get contribPageTitle;

  // The phrase 'Something is missing or wrong?'
  String get contribPageContactHeadline;

  // Justification for missing features/incorrectness by stating young age of app
  String get contribPageContact;

  // The phrase 'To the webpage'
  String get contribPageContactButtonText;

  // The phrase 'Show me the code!'
  String get contribPageCodeHeadline;

  // The phrase 'The source code for the app is available on GitHub:'
  String get contribPageCode;

  // The phrase 'To the GitHub repo'
  String get contribPageCodeButtonText;

  // The word 'Imprint'
  String get imprintPageTitle;

  // The word 'Publisher'
  String get imprintPagePublisher;

  // App publisher address
  String get imprintPageAddress;

  // The phrase 'Disclaimer'
  String get imprintPageDisclaimerHeadline;

  // The disclaimer for the app
  String get imprintPageDisclaimerText;

  // The phrase 'Privacy policy'
  String get imprintPageDataProtectionHeadline;

  // The privacy policy for the app
  String get imprintPageDataProtectionText;

  // The word 'Sources'
  String get imprintPageSourcesHeadline;

  // The word 'App text'
  String get imprintPageTextHeadline;

  // App text author name
  String get imprintPageMyName;

  // The phrase 'Availability data'
  String get imprintPageDataHeadline;

  // Name of author(s) for availability data
  String get imprintPageDataText;

  // Saying thanks to those that let their data be used here
  String get imprintPageDataText2;

  // The word 'Images'
  String get imprintPageImagesHeadline;

  // The word 'Font'
  String get imprintPageFontsHeadline;

  // The word 'Translations'
  String get imprintPageTranslationsHeadline;

  // Font information
  String get imprintPageFontsText;

  // The word 'App Information'
  String get imprintPageAppInfo;

  // The contact webpage for the app
  String get websiteContactPage;

  // The support webpage for the app
  String get websiteSupportPage;

  // The code webpage for the app
  String get seasonCalendarGithub;

  // The word 'Settings'
  String get settingsPageTitle;

  // The phrase 'Sort by availability'
  String get settingsSortingTitle;

  // The phrase 'Show special and unusual foods'
  String get settingsUncommonTitle;

  // The phrase 'e.g. quince, cloudberry'
  String get settingsUncommonText;

  // The phrase 'Filter by availability'
  String get settingsFilterTitle;

  // The word 'Language'
  String get settingsLanguageTitle;

  // The phrase 'Changing the language restarts the app'
  String get settingsLanguageSubtitle;

  // The phrase 'Use device language'
  String get settingsLanguageUseLocale;

  // The phrase 'Uses English if device language is not supported'
  String get settingsLanguageUseLocaleSub;

  // The phrase 'All available foods'
  String get minAvAir;

  // The phrase 'No foods imported via airplane'
  String get minAvSea;

  // The phrase 'No foods imported from overseas/far away'
  String get minAvLand;

  // The phrase 'Only local and regional foods'
  String get minAvLocal;

  // The word 'Support'
  String get supportPageTitle;

  // The phrase 'Do you like the app?'
  String get supportPageSpreadTitle;

  // A text motivating to spread the word about the app if the user likes it
  String get supportPageSpreadText1;

  // Continuation of the motivating text
  String get supportPageSpreadText2;

  // The word 'Give alms'
  String get supportPageHeadline;

  // The statement 'This app will remain fully free of charge and ad-free as long as I am developing it.'
  String get supportPageText1;

  // Something like 'User can go to webpage if they further want to support'
  String get supportPageText2;

  // The phrase 'To the webpage'
  String get supportPageWebsiteLink;

  // The word 'Back'
  String get back;

  // The word 'Wikipedia'
  String get wikipedia;

  // The word 'License: ' (with trailing double dot and space!)
  String get imprintImgSourcesLicense;

  // The word 'Creator: ' (with trailing double dot and space, leading newline!)
  String get imprintImgSourcesPublisher;

  // A text shown when no food is displayed in the current foods view.
  String get emptyFoodsViewText;

  // A text shown when no favorites are displayed in the current foods view.
  String get emptyFavoritesViewText;

  // A hint shown when no favorites are displayed in the current foods view.
  String get emptyFavoritesViewHint;

  // A text shown when no food is displayed in the search result view.
  String get emptySearchViewText;

  // The label used in the search bar
  String get searchFieldLabel;

  // Title shown at the top of the 'more info' page (the one behind the icon with three dots)
  String get etcPageTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  
  
  
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  assert(false, 'AppLocalizations.delegate failed to load unsupported locale "$locale"');
  return null;
}
