import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/themes.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:seasoncalendar/models/food.dart';

class ImprintImgsPage extends StatelessWidget {
  List<Food> _allFoods;
  final Map<String, dynamic> _imprintPageText;

  ImprintImgsPage(List<Food> allFoods, Map<String, dynamic> imprintPageText)
      : this._imprintPageText = imprintPageText {
    this._allFoods = allFoods;
    this
        ._allFoods
        .sort((Food a, Food b) => a.displayName.compareTo(b.displayName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(_imprintPageText['imprintPageImagesHeadline'])),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ListView.separated(
            itemCount: _allFoods.length,
            itemBuilder: (context, i) {
              return ListTile(
                dense: false,
                title: Text(
                  _allFoods[i].displayName,
                  style: defaultTheme.textTheme.headline6,
                ),
                subtitle: Text('Lizenz: ' +
                    _allFoods[i].assetImgInfo.split("/")[0].trim() +
                    "\nUrheber: " +
                    _allFoods[i].assetImgInfo.split("/")[1].trim()),
                trailing: IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () async {
                    final url = _allFoods[i].assetImgSourceUrl;
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  },
                ),
              );
            },
            separatorBuilder: (context, i) => const Divider(
              height: 5,
            ),
          ),
        ));
  }
}
