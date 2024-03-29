import 'package:flutter/material.dart';

enum Availability { none, some, full, unknown }

const Availability n = Availability.none;
const Availability s = Availability.some;
const Availability f = Availability.full;
const Availability u = Availability.unknown;

Availability _fromDouble(double? val) {
  if (val == null || val < 0) return u;
  if (val == 0.0) return n;
  if (val == 1.0) return f;
  return s;
}

double _toDouble(Availability av) {
  if (av == u) return -1.0;
  if (av == n) return 0.0;
  if (av == f) return 1.0;
  return 0.5;
}

int compareAvailabilities(List<Availability> av1, List<Availability> av2) {
  // ASSUMING: av1.length == av2.length
  for (int i = 0; i < av1.length; ++i) {
    int comp = _toDouble(av2[i]).compareTo(_toDouble(av1[i]));
    if (comp != 0) return comp;
  }
  return 0;
}

bool isAvailable(Availability? a) {
  return a != null && a != Availability.unknown && a != Availability.none;
}

List<Availability> overrideAvailabilities(List<Availability> orig,
    List<Availability> over) {
  List<Availability> res = List.of(orig);
  for(int i = 0; i < orig.length; i += 1) {
    if (over[i] != Availability.unknown) {
      res[i] = over[i];
    }
  }
  return res;
}

int getIconAlphaFromAvailability(Availability av) {
  if (av == n || av == u) return 230;
  if (av == f) return 200;
  return 120;
}

const Map<Availability, double> availabilityToIconAlphaFactor = {
  Availability.none: 1.0,
  Availability.full: 1.0,
  Availability.some: 0.5
};

List<Availability> availabilitiesFromStringList(List<String> avStringList) {
  return avStringList
      .map((str) => _fromDouble(double.tryParse(str) ?? -1.0))
      .toList();
}


String availabilitiesToString(List<Availability> avList) {
  return avList.map((av) => _toDouble(av)).join(",");
}

List<bool> availabilitiesToBooleans(List<Availability> avs) {
  return avs.map((Availability e) => e == Availability.full || e == Availability.some).toList();
}

List<Availability> availabilitiesFromBooleans(List<bool> avs) {
  mapii(bool e) {
    if (e) {
      return Availability.full;
    } else {
      return Availability.none;
    }
  }
  return avs.map(mapii).toList();
}

List<Availability> availabilitiesSummary(List<Availability> avs) {
  int fstModeIdx = avs.indexWhere(isAvailable);
  int sndModeIdx = avs.indexWhere(isAvailable, fstModeIdx + 1);

  if (fstModeIdx == -1) {
    if (avs.every((a) => a == Availability.unknown)) {
      return [Availability.unknown];
    }
    return [Availability.none];
  } else if (sndModeIdx == -1) {
    return [avs[fstModeIdx]];
  } else {
    return [avs[fstModeIdx], avs[sndModeIdx]];
  }
}

/*
  idx 0: local
  idx 1: land
  idx 2: sea
  idx 3: air
 */

const Map<int, IconData> availabilityModeIcons = {
  0: Icons.home,
  1: Icons.local_shipping,
  2: Icons.directions_boat,
  3: Icons.airplanemode_active,
  4: Icons.question_mark,
  -1: Icons.remove,
};
Map<int, Color> availabilityModeColor = {
  0: Colors.lightGreenAccent[100]!,
  1: Colors.lime[200]!,
  2: Colors.yellowAccent[100]!,
  3: Colors.orangeAccent[100]!,
  4: Colors.grey[100]!,
  -1: Colors.grey[400]!,
};
const Map<String, int> availabilityModeValues = {
  "local": 0,
  "landTransport": 1,
  "seaTransport": 2,
  "flightTransport": 3,
};

List<String> availabilityNames = availabilityModeValues.keys.toList();

const int avTypeCount = 4;

const List<Widget> avIcons = [
  Icon(Icons.home),
  Icon(Icons.local_shipping),
  Icon(Icons.directions_boat),
  Icon(Icons.airplanemode_active),
  Icon(Icons.remove),
  Icon(Icons.question_mark),
];

const List<String> avSettingsKeys = [
  "showAvLocal",
  "showAvLand",
  "showAvSea",
  "showAvAir",
  "showUnavailable",
  "showUnknown",
];
