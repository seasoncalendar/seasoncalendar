import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'food.dart';
import 'favoritefoods.dart';
import 'foodsview.dart';
import 'foodsearch.dart';
import 'settings.dart';

class HomeState extends State<HomePage> {

  List<Food> _foods = List<Food>();
  bool _favoritesSelected = false;
  int _monthIndex = DateTime.now().toLocal().month - 1;

  HomeState(List<String> favoriteFoodNames, Map<String, dynamic> settings) {
    _foods = _getFilteredAndSortedFoods(favoriteFoodNames, settings);
  }

  static const Map<String, String> etcPages = {
    "Über die App": "/about",
    "App verbessern": "/contribute",
    "Unterstützen": "/support",
    "Impressum": "/imprint"
  };

  @override
  void initState() {
    super.initState();
    //favorites.init();
    setState(() {
      _monthIndex = _monthIndex;
      if (_foods.length == 0) {
        _foods = allFoods;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In Saison'),
        actions: <Widget>[
          IconButton(icon: Icon(_favoritesSelected ? Icons.star : Icons.star_border), onPressed: () {_toggleFavoritesSelected();}),
          IconButton(icon: Icon(Icons.settings), onPressed: _showSettings),
          IconButton(icon: Icon(Icons.search), onPressed: () {showSearch(context: context, delegate: FoodSearch(_monthIndex));}),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
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
      /*body: FutureBuilder(
        future: Future.wait([getFavoriteFoods(), SettingsPageState.getSettings()]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _filterAndSortFoods(snapshot.data[0], snapshot.data[1]);
            return foodsView(_foods, _monthIndex);
          } else {
            return Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        }
      ),*/
      body: foodsView(_foods, _monthIndex),
      bottomNavigationBar: Container(
        color: Colors.black12,
        child: ListTile(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {_shiftMonth(-1);},
          ),
          title: Text(monthToString[_monthIndex], textAlign: TextAlign.center, style: font20b,),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {_shiftMonth(1);},
          ),
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

  List<String> monthToString = ["Januar", "Februar", "März", "April", "Mai",
    "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];

  void _toggleFavoritesSelected() async{
    setState(() {_favoritesSelected = !_favoritesSelected;});
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

    List<Food> filteredFoods = allFoods;
    if (_favoritesSelected) {filteredFoods = getFoodsFromFoodNames(favoriteFoodNames);}

    filteredFoods = filteredFoods.where((food) => [for (String av in food.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
        .reduce(max) >= settings['foodMinAvailability']).toList();
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) => [for (String av in b.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
          .reduce(max).compareTo([for (String av in a.getAvailabilityModes(_monthIndex)) availabilityModeValues[av]]
          .reduce(max)));
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

  List<String> _favoriteFoodNames;
  Map<String, dynamic> _settings;

  HomePage(List<String> favoriteFoodNames, Map<String, dynamic> settings) {
    _favoriteFoodNames = favoriteFoodNames;
    _settings = settings;
  }

  @override
  HomeState createState() => HomeState(_favoriteFoodNames, _settings);
}