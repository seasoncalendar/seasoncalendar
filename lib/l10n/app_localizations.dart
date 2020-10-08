
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

  // The title of the app
  String get appTitle;

  // 'January'
  String get january;

  // 'February'
  String get february;

  // 'March'
  String get march;

  // 'April'
  String get april;

  // 'May'
  String get may;

  // 'June'
  String get june;

  // 'July'
  String get july;

  // 'August'
  String get august;

  // 'September'
  String get september;

  // 'October'
  String get october;

  // 'November'
  String get november;

  // 'December'
  String get december;

  // 'Imprint'
  String get imprintPageButtonText;

  // 'Explanation'
  String get aboutPageTitle;

  // 'How do I use the app?'
  String get aboutPageExplanationHeadline;

  // A sentence explaining what the app does
  String get aboutPageExplanation;

  // 'In season/locally or regionally available.'
  String get aboutPageAvLocal;

  // 'Imported from not too far away, mostly via land transport.'
  String get aboutPageAvLand;

  // 'Imported from far away, mostly shipped.'
  String get aboutPageAvSea;

  // 'Imported from far away, mostly by airplane.'
  String get aboutPageAvAir;

  // Describes what the food bg colors do
  String get aboutPageColors;

  // Describes how to use the favorites function
  String get aboutPageFavorites;

  // 'Why care about foods' seasons?'
  String get aboutPageHeadline;

  // Justification for caring about food seasons
  String get aboutPageLeading;

  // 'Fresh produce tastes better and is healthier for your body.'
  String get aboutPageAdvantage1;

  // 'Fresh foods are generally cheaper.'
  String get aboutPageAdvantage2;

  // 'The efforts made for storing foods is reduced.'
  String get aboutPageAdvantage3;

  // 'The transport is less harmful to the environment.'
  String get aboutPageAdvantage4;

  // 'You support local businesses and jobs.'
  String get aboutPageAdvantage5;

  // Benefits for the app user
  String get aboutPageTrailing;

  // A disclaimer for the availability data
  String get aboutPageDisclaimer;

  // 'Contribute'
  String get contribPageTitle;

  // 'Something is missing or wrong?'
  String get contribPageContactHeadline;

  // Justification for missing features/incorrectness by stating young age of app
  String get contribPageContact;

  // 'To the webpage'
  String get contribPageContactButtonText;

  // 'Show me the code!'
  String get contribPageCodeHeadline;

  // 'The source code for the app is available on GitHub:'
  String get contribPageCode;

  // 'To the GitHub repo'
  String get contribPageCodeButtonText;

  // 'Imprint'
  String get imprintPageTitle;

  // 'Publisher'
  String get imprintPagePublisher;

  // App publisher address
  String get imprintPageAddress;

  // 'Disclaimer'
  String get imprintPageDisclaimerHeadline;

  // The disclaimer for the app
  String get imprintPageDisclaimerText;

  // 'Privacy policy'
  String get imprintPageDataProtectionHeadline;

  // The privacy policy for the app
  String get imprintPageDataProtectionText;

  // 'Sources'
  String get imprintPageSourcesHeadline;

  // 'App text'
  String get imprintPageTextHeadline;

  // App text author name
  String get imprintPageMyName;

  // 'Availability data'
  String get imprintPageDataHeadline;

  // Name of author(s) for availability data
  String get imprintPageDataText;

  // Saying thanks to those that let their data be used here
  String get imprintPageDataText2;

  // 'Images'
  String get imprintPageImagesHeadline;

  // 'Font'
  String get imprintPageFontsHeadline;

  // Font information
  String get imprintPageFontsText;

  // 'App Information'
  String get imprintPageAppInfo;

  // the contact webpage for the app
  String get websiteContactPage;

  // the support webpage for the app
  String get websiteSupportPage;

  // the code webpage for the app
  String get seasonCalendarGithub;

  // 'Settings'
  String get settingsPageTitle;

  // 'Sort by availability'
  String get settingsSortingTitle;

  // 'Show special and unusual foods'
  String get settingsUncommonTitle;

  // 'e.g. quince, cloudberry'
  String get settingsUncommonText;

  // 'Filter by availability'
  String get settingsFilterTitle;

  // 'All available foods'
  String get minAvAir;

  // 'No foods imported via airplane'
  String get minAvSea;

  // 'No foods imported from overseas/far away'
  String get minAvLand;

  // 'Only local and regional foods'
  String get minAvLocal;

  // 'Support'
  String get supportPageTitle;

  // 'Do you like the app?'
  String get supportPageSpreadTitle;

  // A text motivating to spread the word about the app if the user likes it
  String get supportPageSpreadText1;

  // Continuation of the motivating text
  String get supportPageSpreadText2;

  // 'Give alms'
  String get supportPageHeadline;

  // 'This app will remain fully free of charge and ad-free as long as I am developing it.'
  String get supportPageText1;

  // User can go to webpage if they further want to support
  String get supportPageText2;

  // 'To the webpage'
  String get supportPageWebsiteLink;

  // 'Back'
  String get back;

  // 'Wikipedia'
  String get wikipedia;

  // 'License: ' (trailing double dot and space!)
  String get imprintImgSourcesLicense;

  // 'Creator: ' (trailing double dot and space, leading newline!)
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

  // Title of the etcPage
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
