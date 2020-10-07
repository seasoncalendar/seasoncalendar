import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

String getMonthNameFromIndex(BuildContext context, int monthIndex) {
  // indices start from 0
  switch (monthIndex) {
    case 0:
      return AppLocalizations.of(context).january;
    case 1:
      return AppLocalizations.of(context).february;
    case 2:
      return AppLocalizations.of(context).march;
    case 3:
      return AppLocalizations.of(context).april;
    case 4:
      return AppLocalizations.of(context).may;
    case 5:
      return AppLocalizations.of(context).june;
    case 6:
      return AppLocalizations.of(context).july;
    case 7:
      return AppLocalizations.of(context).august;
    case 8:
      return AppLocalizations.of(context).september;
    case 9:
      return AppLocalizations.of(context).october;
    case 10:
      return AppLocalizations.of(context).november;
    case 11:
      return AppLocalizations.of(context).december;
    default:
      return AppLocalizations.of(context).december;
  }
}

final int avTypeCount = 4;

String getMinAvTextFromIndex(BuildContext context, int minAvIndex) {
  // 0 = all, 1 = no air transport, 2 = no air/sea transport, 3 = only local/regional
  switch (minAvIndex) {
    case 0:
      return AppLocalizations.of(context).minAvAir;
    case 1:
      return AppLocalizations.of(context).minAvSea;
    case 2:
      return AppLocalizations.of(context).minAvLand;
    case 3:
      return AppLocalizations.of(context).minAvLocal;
    default:
      return AppLocalizations.of(context).minAvLocal;
  }
}
