import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'favoritefoods.dart';
import 'foodsview.dart';
import 'foodsearch.dart';
import 'settings.dart';

class HomeState extends State<HomePage> {

  List<Food> _foods;
  bool _favoritesSelected;
  DateTime _date;

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
      _date = new DateTime.now();
      _foods = allFoods;
      _favoritesSelected = false;
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
          IconButton(icon: Icon(Icons.search), onPressed: () {showSearch(context: context, delegate: FoodSearch(_date.toLocal().month));}),
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
      body: foodsView(_foods, _date.toLocal().month),
      bottomNavigationBar: Container(
        color: Colors.black12,
        child: ListTile(
          title: Text(_date.toLocal().day.toString() + "." +
              _date.toLocal().month.toString() + "." +
              _date.toLocal().year.toString()),
          trailing: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {_selectDate(context);},
          ),
        ),
      )
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: _date.subtract(new Duration(days: 365)),
        lastDate: _date.add(new Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _toggleFavoritesSelected() async{
    setState(() {_favoritesSelected = !_favoritesSelected;});
    _filterAndSortFoods();
  }

  void _filterAndSortFoods() async {
    List<Food> filteredFoods;
    if (_favoritesSelected) {
      final favoriteFoodNames = await getFavoriteFoods();
      filteredFoods = getFoodsFromFoodNames(favoriteFoodNames);
    } else {
      filteredFoods = allFoods;
    }
    Map<String, dynamic> settings = await SettingsPageState.getSettings();
    filteredFoods = filteredFoods.where((food) => [for (String av in food.getAvailabilityModes(_date.toLocal().month)) availabilityModeValues[av]]
        .reduce(max) >= settings['foodMinAvailability']).toList();
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) => [for (String av in b.getAvailabilityModes(_date.toLocal().month)) availabilityModeValues[av]]
          .reduce(max).compareTo([for (String av in a.getAvailabilityModes(_date.toLocal().month)) availabilityModeValues[av]]
          .reduce(max)));
    }
    setState(() {
      _foods = filteredFoods;
    });
  }

  void _showSettings() {
    Navigator.of(context).pushNamed("/settings")
        .then((_) => _filterAndSortFoods());
  }

  void _chooseEtcPage(String pageRoute) {
    Navigator.of(context).pushNamed(etcPages[pageRoute]);
  }
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}