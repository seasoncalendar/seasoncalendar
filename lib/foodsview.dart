import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favoritefoods.dart';

Widget foodsInSeasonView(List<String> foodsToDisplay) {
  return GridView.builder(
    itemCount: foodsToDisplay.length,
    padding: const EdgeInsets.all(16.0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,

    ),
    itemBuilder: (context, i) {
      return FoodTile(foodsToDisplay[i]);
    },
  );
}

class FoodTile extends StatefulWidget {

  String _foodName;

  FoodTile(String foodName) {
    _foodName = foodName;
  }

  @override
  FoodTileState createState() => new FoodTileState();
}

class FoodTileState extends State<FoodTile> {

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isFavoriteFood(widget._foodName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _isFavorite = snapshot.hasData ? snapshot.data : _isFavorite;
          return GestureDetector(
              onTap: () {
                if (_isFavorite) {
                  removeFavoriteFood(widget._foodName);
                }
                else {
                  addFavoriteFood(widget._foodName);
                }
                setState(() {
                  _isFavorite = !_isFavorite;
                });
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
                                          widget._foodName,
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Icon(
                                          _isFavorite ? Icons.star : Icons.star_border,
                                          color: _isFavorite ? null : null,
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}