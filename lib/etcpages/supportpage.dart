import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';

import 'package:in_app_purchase/in_app_purchase.dart';

final String supportText1 = "Für diese App wird es weder irgendwelche"
  " Bezahlfeatures geben, noch werde ich irgendwelche Werbung platzieren."
  " Diese App ist und bleibt von meiner Seite aus kostenlos für dich.";

final String supportText2 = "Du kannst mir aber gerne eine kleine Spende da"
  " lassen! Das Geld wird effizient zur Steigerung der Arbeitsmoral verwendet,"
  " z.B. indem frisches Saisonobst gekauft wird und bei der Arbeit an"
  " diesem oder anderen Projekten verzehrt wird.";

class SupportPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => SupportPageState();
}

class SupportPageState extends State<SupportPage> {

  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  bool _iapAvailable = true;

  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  StreamSubscription _subscription;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Unterstützen")
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text("Möchtest du mich unterstützen?", style: font20b),
            SizedBox(height: 20),
            Text(supportText1, style: font18, textAlign: TextAlign.justify),
            SizedBox(height: 10),
            Text(supportText2, style: font18, textAlign: TextAlign.justify),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                for (var prod in _products)

                  ...[
                    Text(prod.title, style: Theme.of(context).textTheme.headline5),
                    Text(prod.description),
                    Text(prod.price, style: TextStyle(color: Colors.greenAccent, fontSize: 20)),
                    RaisedButton(
                      child: _iapAvailable ? Text("\$\$\$")
                          : Text("Zahlungsservice nicht verfügbar"),
                      onPressed: _iapAvailable ? () => _buyProduct(prod) : null,
                    ),
                  ]
              ],
            )
          ],
        )
      )
    );
  }

  void _initialize() async {
    _iapAvailable = await _iap.isAvailable();

    if(_iapAvailable) {
      List<Future> futures = [_getProducts(), _getPastPurchases()];
      await Future.wait(futures);

      _subscription = _iap.purchaseUpdatedStream.listen((data) {
        setState(() {
          print("NEW PURCHASE");
          _purchases.addAll(data);
          _verifyPurchase();
        });
      });
    }
  }

  Future<void> _getProducts() async {
    Set<String> ids = Set.from(["donation"]);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);

    setState(() {
      _products = response.productDetails;
    });
  }

  Future<void> _getPastPurchases() async {
    QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases(); // does not return consumed products.

    for (PurchaseDetails purchase in response.pastPurchases) {
      if (Platform.isIOS) {
        _iap.completePurchase(purchase);
      }
    }

    // TODO handle consumables

    setState(() {
      _purchases = response.pastPurchases;
    });
  }

  PurchaseDetails _hasPurchased(String productID) {
    return _purchases.firstWhere(
            (purchase) => purchase.productID == productID, orElse: () => null
    );
  }

  void _verifyPurchase() {
    PurchaseDetails purchase = _hasPurchased("donation");

    if (purchase != null && purchase.status == PurchaseStatus.purchased) {
      print("Verified purchase");
    }
  }

  void _buyProduct(ProductDetails prod) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: prod);
    _iap.buyConsumable(purchaseParam: purchaseParam);
  }
}