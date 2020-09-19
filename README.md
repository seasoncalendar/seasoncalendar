# seasoncalendar

This app is a practical and easy to use tool showing you which kinds of fruit, vegetables, salads etc. are in season right now.

Foods that are produced regionally are often times cheaper, tastier and better for the environment due to a shorter and more convenient transport.

While currently available only in German and for Germany/Austria/Switzerland, I plan to extend the languages and regions offered.

## Get it!

- **From Google Play**: https://play.google.com/store/apps/details?id=flunzmas.seasoncalendar
- **From F-Droid**: *coming soon!*
- **From my website**: https://flunzmas.com/seasonal-foods-calendar

## Screenshots

![scr1](assets/screenshots/Screenshot_20200818-192031.jpg) ![scr3](assets/screenshots/Screenshot_20200818-192041.jpg)

## Asset Sources

The database file `assets/db/foods.db` contains all food information and their respective sources. You can open the file e.g. with ![the official SQLite DB Browser](https://sqlitebrowser.org/).

Please note that the data concerning foods' availability partly stems from ![lebensmittellexikon.de](lebensmittellexikon.de) and thus is __not__ subject to the GPL license. I kindly ask you to contact me before re-using the availability data (columns starting with 'av' from the file `assets/db/foods.db`).

# Installation

0. Clone the repo
1. `flutter pub get`
2. `flutter build apk --debug` **or** `flutter build apk --release`

_You need an own key to sign release versions of this app._

_Helpful info:_ https://flutter.dev/docs/deployment/android
