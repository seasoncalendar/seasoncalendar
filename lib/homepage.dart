import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/seasoncalendaricons.dart';
import 'package:seasoncalendar/helpers/themes.dart';
import 'food.dart';
import 'favoritefoods.dart';
import 'foodsview.dart';
import 'foodsearch.dart';
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
      _foods = _getFilteredAndSortedFoods(widget._favoriteFoodNames, widget._settings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(_favoritesSelected ? Icons.star : Icons.star_border), onPressed: () {_toggleFavoritesSelected();}),
          IconButton(icon: Icon(Icons.settings), onPressed: _showSettings),
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(
              context: context,
              delegate: FoodSearch(widget._allFoods, _monthIndex, widget._hpText['monthToString'])
            );
          }),
          FlatButton(
              child: Text(widget._hpText['imprintPageButtonText'], style: defaultTheme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),),
              onPressed: () {Navigator.of(context).pushNamed("/imprint");}
          ),
          PopupMenuButton(
            icon: Icon(Icons.help),
            onSelected: _chooseEtcPage,
            itemBuilder: (context) {
              return etcPages.keys.map((String page) {
                return PopupMenuItem<String>(
                  value: page,
                  child: Text(page)
                );
              }).toList();
            },
          ),
        ],
      ),
      body: foodsView(_foods, _monthIndex, widget._hpText['monthToString']),
      bottomNavigationBar: Container(
        color: defaultTheme.primaryColor,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 25,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: _fruitsSelected ? Icon(SeasonCalendarIcons.apple_alt, color: Colors.black,)
                        : Icon(SeasonCalendarIcons.apple_alt, color: Colors.black26,),
                      onPressed: () {_toggleFruitsSelected();},
                    ),
                    IconButton(
                      icon: _nonFruitsSelected ? Icon(SeasonCalendarIcons.carrot, color: Colors.black,)
                          : Icon(SeasonCalendarIcons.carrot, color: Colors.black26,),
                      onPressed: () {_toggleNonFruitsSelected();},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 75,
              child: Container(
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(SeasonCalendarIcons.arrow_left, color: Colors.black,),
                    onPressed: () {_shiftMonth(-1);},
                  ),
                  title: Text(widget._hpText['monthToString'][_monthIndex], textAlign: TextAlign.center, style: defaultTheme.textTheme.headline5,),
                  trailing: IconButton(
                    icon: const Icon(SeasonCalendarIcons.arrow_right, color: Colors.black,),
                    onPressed: () {_shiftMonth(1);},
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  _shiftMonth(int value) {
    setState(() {
      _monthIndex = (_monthIndex + value) % 12;
    });
    _filterAndSortFoodsAsync();
  }

  void _toggleFavoritesSelected() async{
    setState(() {_favoritesSelected = !_favoritesSelected;});
    _filterAndSortFoodsAsync();
  }

  void _toggleFruitsSelected() async{
    setState(() {_fruitsSelected = !_fruitsSelected;});
    _filterAndSortFoodsAsync();
  }

  void _toggleNonFruitsSelected() async{
    setState(() {_nonFruitsSelected = !_nonFruitsSelected;});
    _filterAndSortFoodsAsync();
  }

  _filterAndSortFoodsAsync() async {
    final favoriteFoodNames = await getFavoriteFoods();
    Map<String, dynamic> settings = await SettingsPageState.getSettings();
    setState(() {
      _foods = _getFilteredAndSortedFoods(favoriteFoodNames, settings);
    });
  }

  List<Food> _getFilteredAndSortedFoods(List<String> favoriteFoodNames, Map<String, dynamic> settings) {

    List<Food> filteredFoods = widget._allFoods;

    if (_favoritesSelected) {
      filteredFoods = getFoodsFromFoodNames(favoriteFoodNames, widget._allFoods);
    }
    if (settings['includeUncommon'] == false) {
      filteredFoods = filteredFoods.where((food) => food.isCommon).toList();
    }
    if (!_fruitsSelected) {
      filteredFoods = filteredFoods.where((food) => food.type != "fruit").toList();
    }
    if (!_nonFruitsSelected) {
      filteredFoods = filteredFoods.where((food) => food.type != "nonFruit").toList();
    }
    filteredFoods = filteredFoods.where((food) => [for (String av in food.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
        .reduce(max) >= settings['foodMinAvailability']).toList();
    filteredFoods.sort((a, b) => a.name.compareTo(b.name));
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) {
        int comp = [for (String av in b.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
          .reduce(max)
          .compareTo([for (String av in a.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
          .reduce(max));
      if (comp != 0) return comp;
      else return a.name.compareTo(b.name);
      });
    }
    return filteredFoods;
  }

  void _showSettings() {
    Navigator.of(context).pushNamed("/settings")
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

  HomePage(List<String> favoriteFoodNames, Map<String, dynamic> settings,
      Map<String, dynamic> homepageText, List<Food> allFoods,) :
    _favoriteFoodNames = favoriteFoodNames,
    _settings = settings,
    _hpText = homepageText,
    _allFoods = allFoods;

  @override
  HomeState createState() => HomeState();
}