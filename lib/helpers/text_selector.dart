import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/generated/l10n.dart';

String getMonthNameFromIndex(BuildContext context, int monthIndex) {
  // indices start from 0
  switch (monthIndex) {
    case 0:
      return L10n.of(context).january;
    case 1:
      return L10n.of(context).february;
    case 2:
      return L10n.of(context).march;
    case 3:
      return L10n.of(context).april;
    case 4:
      return L10n.of(context).may;
    case 5:
      return L10n.of(context).june;
    case 6:
      return L10n.of(context).july;
    case 7:
      return L10n.of(context).august;
    case 8:
      return L10n.of(context).september;
    case 9:
      return L10n.of(context).october;
    case 10:
      return L10n.of(context).november;
    case 11:
      return L10n.of(context).december;
    default:
      return L10n.of(context).december;
  }
}

final int avTypeCount = 4;

String getMinAvTextFromIndex(BuildContext context, int minAvIndex) {
  // 0 = all, 1 = no air transport, 2 = no air/sea transport, 3 = only local/regional
  switch (minAvIndex) {
    case 0:
      return L10n.of(context).minAvAir;
    case 1:
      return L10n.of(context).minAvSea;
    case 2:
      return L10n.of(context).minAvLand;
    case 3:
      return L10n.of(context).minAvLocal;
    default:
      return L10n.of(context).minAvLocal;
  }
}
