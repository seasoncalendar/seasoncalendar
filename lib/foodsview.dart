import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favoritefoods.dart';

Widget foodsInSeasonView(BuildContext context, List<String> foodsToDisplay,
    FavoriteFoods favorites, void _updateFavorites(FavoriteFoods favorites)) {
  return GridView.builder(
    itemCount: foodsToDisplay.length,
    padding: const EdgeInsets.all(16.0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,

    ),
    itemBuilder: (context, i) {
      return _foodTile(foodsToDisplay[i], favorites, _updateFavorites);
    },
  );
}

Widget _foodTile(String foodName, FavoriteFoods favorites, void _updateFavorites(FavoriteFoods favorites)) {
  bool isFavorite = favorites.isFavoriteFood(foodName);
  return GestureDetector(
    onTap: () {
      if (isFavorite) {
        favorites.removeFavoriteFood(foodName);
        _updateFavorites(favorites);
      }
      else {
        favorites.addFavoriteFood(foodName);
        _updateFavorites(favorites);
      }
      isFavorite = !isFavorite;
    },
    child: Card(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image(
                  image: AssetImage("img/apple.jpg"),
                  filterQuality: FilterQuality.low,
              ),
            )
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.greenAccent,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 12,
                      child: Text(
                        foodName,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Icon(
                        isFavorite ? Icons.star : Icons.star_border,
                        color: isFavorite ? null : null,
                      ),
                    )
                  ],
                )
              )
            )
          )
        ],
      )
    )
  );
}