import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/seasoncalendar_icons.dart';
import 'package:seasoncalendar/helpers/themes.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'models/food.dart';
import 'favorite_foods.dart';
import 'food_view.dart';
import 'food_search.dart';
import 'settings.dart';
import 'routes.dart';

class HomeState extends State<HomePage> {
  List<Food> _foods = List<Food>();
  bool _favoritesSelected = false;
  bool _fruitsSelected = true;
  bool _nonFruitsSelected = true;
  int _monthIndex = DateTime.now().toLocal().month - 1;

  @override
  void initState() {
    super.initState();
    //favorites.init();
    setState(() {
      _monthIndex = _monthIndex;
      _favoritesSelected = _favoritesSelected;
      _foods = _getFilteredAndSortedFoods(
          widget._favoriteFoodNames, widget._settings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SwipeGestureRecognizer(
            onSwipeLeft: () {
              _shiftMonth(1);
            },
            onSwipeRight: () {
              _shiftMonth(-1);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 10,
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      color: Colors.white24,
                      child: IconButton(
                          icon: const Icon(
                            SeasonCalendarIcons.arrow_left,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _shiftMonth(-1);
                          }),
                    )),
                Expanded(
                  flex: 20,
                  child: Container(
                      margin: const EdgeInsets.all(2),
                      child: GestureDetector(
                          child: Text(
                            widget._hpText['monthToString'][_monthIndex],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: double.minPositive,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: widget._hpText['monthToString']
                                                  .length *
                                              2 -
                                          1,
                                      itemBuilder: (context, i) {
                                        if (i % 2 == 0) {
                                          return ListTile(
                                            title: Text(
                                              widget._hpText['monthToString']
                                                  [(i / 2).round()],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              _setMonth((i / 2).round());
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        } else {
                                          return const Divider(
                                            height: 0,
                                          );
                                        }
                                      }),
                                ),
                                elevation: 10,
                              ),
                              barrierDismissible: true,
                            );
                          })),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    color: Colors.white24,
                    child: IconButton(
                      icon: const Icon(
                        SeasonCalendarIcons.arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _shiftMonth(1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: foodsView(_foods, _monthIndex, widget._hpText['monthToString']),
        bottomNavigationBar: Container(
          color: defaultTheme.primaryColor,
          child: Row(
            children: <Widget>[
              Spacer(flex: 2),
              Expanded(
                flex: 10,
                child: IconButton(
                  icon: _fruitsSelected
                      ? Icon(
                          SeasonCalendarIcons.apple_alt,
                          color: Colors.black,
                        )
                      : Icon(
                          SeasonCalendarIcons.apple_alt,
                          color: Colors.black26,
                        ),
                  onPressed: () {
                    _toggleFruitsSelected();
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: IconButton(
                  icon: _nonFruitsSelected
                      ? Icon(
                          SeasonCalendarIcons.carrot,
                          color: Colors.black,
                        )
                      : Icon(
                          SeasonCalendarIcons.carrot,
                          color: Colors.black26,
                        ),
                  onPressed: () {
                    _toggleNonFruitsSelected();
                  },
                ),
              ),
              Spacer(flex: 5),
              Expanded(
                flex: 10,
                child: IconButton(
                  icon:
                      Icon(_favoritesSelected ? Icons.star : Icons.star_border),
                  onPressed: () {
                    _toggleFavoritesSelected();
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: FoodSearch(widget._allFoods, _monthIndex,
                              widget._hpText['monthToString'], "Suche..."));
                    }),
              ),
              Spacer(flex: 5),
              Expanded(
                flex: 10,
                child: IconButton(
                    icon: Icon(Icons.settings), onPressed: _showSettings),
              ),
              Expanded(
                flex: 10,
                child: PopupMenuButton(
                  icon: Icon(Icons.help),
                  offset: Offset(0, -205),
                  onSelected: _chooseEtcPage,
                  itemBuilder: (context) {
                    return etcPages.keys.map((String page) {
                      return PopupMenuItem<String>(
                          value: page, child: Text(page));
                    }).toList();
                  },
                ),
              ),
              Spacer(flex: 2)
            ],
          ),
        ));
  }

  _setMonth(int value) {
    setState(() {
      _monthIndex = value % 12;
    });
    _filterAndSortFoodsAsync();
  }

  _shiftMonth(int value) {
    setState(() {
      _monthIndex = (_monthIndex + value) % 12;
    });
    _filterAndSortFoodsAsync();
  }

  void _toggleFavoritesSelected() async {
    setState(() {
      _favoritesSelected = !_favoritesSelected;
    });
    _filterAndSortFoodsAsync();
  }

  void _toggleFruitsSelected() async {
    setState(() {
      if (!_fruitsSelected) {
        _fruitsSelected = true;
      } else if (_nonFruitsSelected) {
        _nonFruitsSelected = false;
      } else {
        _nonFruitsSelected = true;
      }
    });
    _filterAndSortFoodsAsync();
  }

  void _toggleNonFruitsSelected() async {
    setState(() {
      if (!_nonFruitsSelected) {
        _nonFruitsSelected = true;
      } else if (_fruitsSelected) {
        _fruitsSelected = false;
      } else {
        _fruitsSelected = true;
      }
    });
    _filterAndSortFoodsAsync();
  }

  _filterAndSortFoodsAsync() async {
    final favoriteFoodIds = await getFavoriteFoods();
    Map<String, dynamic> settings = await SettingsPageState.getSettings();
    setState(() {
      _foods = _getFilteredAndSortedFoods(favoriteFoodIds, settings);
    });
  }

  List<Food> _getFilteredAndSortedFoods(
      List<String> favoriteFoodIds, Map<String, dynamic> settings) {
    List<Food> filteredFoods = widget._allFoods;

    if (_favoritesSelected) {
      filteredFoods =
          getFoodsFromIds(favoriteFoodIds, widget._allFoods);
    }
    if (settings['includeUncommon'] == false) {
      filteredFoods = filteredFoods.where((food) => food.isCommon).toList();
    }
    if (!_fruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "fruit").toList();
    }
    if (!_nonFruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "nonFruit").toList();
    }
    filteredFoods = filteredFoods
        .where((food) =>
            [
              for (String av in food.getAvailabilityModes(_monthIndex))
                availabilityModeValues[av]
            ].reduce(max) >=
            settings['foodMinAvailability'])
        .toList();
    filteredFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) {
        int comp = [
          for (String av in b.getAvailabilityModes(_monthIndex))
            availabilityModeValues[av]
        ].reduce(max).compareTo([
              for (String av in a.getAvailabilityModes(_monthIndex))
                availabilityModeValues[av]
            ].reduce(max));
        if (comp != 0)
          return comp;
        else
          return a.displayName.compareTo(b.displayName);
      });
    }
    return filteredFoods;
  }

  void _showSettings() {
    Navigator.of(context)
        .pushNamed("/settings")
        .then((_) => _filterAndSortFoodsAsync());
  }

  void _chooseEtcPage(String pageRoute) {
    Navigator.of(context).pushNamed(etcPages[pageRoute]);
  }
}

class HomePage extends StatefulWidget {
  final List<String> _favoriteFoodNames;
  final Map<String, dynamic> _settings;
  final Map<String, dynamic> _hpText;
  final List<Food> _allFoods;

  HomePage(
    List<String> favoriteFoodNames,
    Map<String, dynamic> settings,
    Map<String, dynamic> homepageText,
    List<Food> allFoods,
  )   : _favoriteFoodNames = favoriteFoodNames,
        _settings = settings,
        _hpText = homepageText,
        _allFoods = allFoods;

  @override
  HomeState createState() => HomeState();
}
