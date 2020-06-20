import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'foods.dart';
import 'favoritefoods.dart';
import 'foodsview.dart';
import 'foodsearch.dart';

class HomeState extends State<HomePage> {

  List<String> foods;
  bool favoritesSelected;
  DateTime date;

  static const Map<String, String> etcPages = {
    "About": "/about",
    "Contribute": "/contribute",
    "Support": "/support",
    "Imprint": "/imprint"
  };

  @override
  void initState() {
    super.initState();
    //favorites.init();
    setState(() {
      date = new DateTime.now();
      foods = allFoods;
      favoritesSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In Saison'),
        actions: <Widget>[
          IconButton(icon: Icon(favoritesSelected ? Icons.star : Icons.star_border), onPressed: () {_toggleFavoritesSelected();}),
          IconButton(icon: Icon(Icons.settings), onPressed: _showSettings),
          IconButton(icon: Icon(Icons.search), onPressed: () {showSearch(context: context, delegate: FoodSearch());}),
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
      body: foodsInSeasonView(foods),
      bottomNavigationBar: Container(
        color: Colors.black12,
        child: ListTile(
          title: Text(date.toLocal().day.toString() + "." +
              date.toLocal().month.toString() + "." +
              date.toLocal().year.toString()),
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
        initialDate: date,
        firstDate: date.subtract(new Duration(days: 365)),
        lastDate: date.add(new Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }

  void _toggleFavoritesSelected() async{
    setState(() {
      favoritesSelected = !favoritesSelected;
    });
    if (favoritesSelected) {
      final newFoods = await getFavoriteFoods();
      setState(() {
        foods = newFoods;
      });
    } else {
      setState(() {
        foods = allFoods;
      });
    }
  }

  void _showSettings() {
    Navigator.of(context).pushNamed("/settings");
  }

  void _chooseEtcPage(String pageRoute) {
    Navigator.of(context).pushNamed(etcPages[pageRoute]);
  }
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}