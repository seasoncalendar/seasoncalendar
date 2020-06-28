import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favoritefoods.dart';
import 'food.dart';

Widget foodsView(List<Food> preparedFoods, int monthIndex) {

  return GridView.builder(
    itemCount: preparedFoods.length,
    padding: const EdgeInsets.all(16.0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,

    ),
    itemBuilder: (context, i) {
      return FoodTile(preparedFoods[i], monthIndex);
    },
  );
}

class FoodTile extends StatefulWidget {

  String _foodName;
  String _assetImgPath;
  Color _availabilityColor = Colors.black12;
  Container _availabilityIconContainer;
  int _nameContainerFlex = 12;
  int _avIconContainerFlex = 2;

  FoodTile(Food foodToDisplay, int monthIndex) {
    _foodName = foodToDisplay.name;
    _assetImgPath = foodToDisplay.assetImgPath;
    List<String> availabilities = foodToDisplay.getAvailabilityModes(monthIndex);
    _availabilityColor = availabilityModeColor[availabilities[0]];
    if (availabilities.length == 1) {
      _availabilityIconContainer = Container(
        child: availabilityModeIcons[availabilities[0]],
      );
    } else {
      _nameContainerFlex = 10;
      _avIconContainerFlex = 4;
      _availabilityIconContainer = Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            availabilityModeIcons[availabilities[0]],
            availabilityModeIcons[availabilities[1]],
          ],
        ),
      );
    }
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
          return Card(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Stack(
                      overflow: Overflow.clip,
                      alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                        Image(
                          image: AssetImage(widget._assetImgPath),
                          filterQuality: FilterQuality.low,
                        ),
                        Positioned(
                          top: -40,
                          right: -40,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          child: InkWell(
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
                            child: Icon(
                              _isFavorite ? Icons.star : Icons.star_border,
                              color: _isFavorite ? null : null,
                              size: 27,
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: widget._availabilityColor,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: widget._nameContainerFlex,
                              child: Text(
                                widget._foodName,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              flex: widget._avIconContainerFlex,
                              child: widget._availabilityIconContainer
                            ),
                          ],
                        )
                      )
                    )
                  )
                ],
              )
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

const Map<String, Icon> availabilityModeIcons = {
  "localSeason": Icon(Icons.home, color: Colors.green),
  "localStorage": Icon(Icons.home),
  "landTransportSeason": Icon(Icons.local_shipping, color: Colors.green,),
  "landTransportStorage":  Icon(Icons.local_shipping),
  "seaTransportAvailable":  Icon(Icons.directions_boat),
  "flightTransportAvailable": Icon(Icons.airplanemode_active),
  "notAvailable": Icon(Icons.remove),
};

const Map<String, Color> availabilityModeColor = {
  "localSeason": Colors.lightGreen,
  "localStorage": Colors.lightGreenAccent,
  "landTransportSeason": Colors.lime,
  "landTransportStorage":  Colors.limeAccent,
  "seaTransportAvailable":  Colors.yellowAccent,
  "flightTransportAvailable": Colors.orangeAccent,
  "notAvailable": Colors.black12,
};

const Map<String, double> availabilityModeValues = {
  "localSeason": 3.5,
  "localStorage": 3,
  "landTransportSeason": 2.5,
  "landTransportStorage":  2,
  "seaTransportAvailable":  1,
  "flightTransportAvailable": 0,
  "notAvailable": -1,
};