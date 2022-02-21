import 'package:flutter/material.dart';
import 'package:seasoncalendar/app_config.dart';

import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/lang_helper.dart';

class ImprintPage extends StatelessWidget {
  const ImprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _l10nIndependentText = AppConfig.of(context).independentText;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).imprintPageTitle)),
      body: Container(
          margin: const EdgeInsets.all(18),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                L10n.of(context).imprintPagePublisher,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(_l10nIndependentText["developerAddress"],
                  textAlign: TextAlign.left),
              const SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDisclaimerHeadline,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDisclaimerText,
                  textAlign: TextAlign.justify),
              const SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDataProtectionHeadline,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDataProtectionText,
                  textAlign: TextAlign.justify),
              const SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageSourcesHeadline,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageTextHeadline,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                languageNameFromCode["de"]! +
                    ", " +
                    languageNameFromCode["en"]! +
                    ", " +
                    languageNameFromCode["fr"]! +
                    ": " +
                    L10n.of(context).imprintPageMyName,
                textAlign: TextAlign.left,
              ),
              Text(
                languageNameFromCode["es"]! + ": Luciano Gardella",
                textAlign: TextAlign.left,
              ),
              Text(
                languageNameFromCode["pl"]! + ": Mateusz Bartczak (matebart)",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDataHeadline,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageDataText,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDataText2,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontStyle: FontStyle.italic)),
              const SizedBox(height: 20),
              GestureDetector(
                child: Text(
                  L10n.of(context).imprintPageImagesHeadline,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.left,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed("/etc/imprint/imgs"),
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageFontsHeadline,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageFontsText,
                textAlign: TextAlign.left,
              ),
            ],
          ))),
    );
  }
}
