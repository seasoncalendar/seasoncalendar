# Seasonal Foods Calendar

[<img src="https://img.shields.io/github/release/flunzmas/seasoncalendar.svg?logo=github">](https://github.com/Flunzmas/seasoncalendar/releases/latest)
[<img src="https://img.shields.io/f-droid/v/flunzmas.seasoncalendar.svg">](https://f-droid.org/packages/flunzmas.seasoncalendar)
[<img src="https://img.shields.io/github/license/flunzmas/seasoncalendar">](/LICENSE)

A practical and easy to use app showing you which kinds of fruit, vegetables, salads etc. are in season right now.

Foods that are produced regionally are often times cheaper, tastier and better for the environment due to a shorter and more convenient transport.

[<img alt='Get it on F-Droid' src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" height="75">](https://f-droid.org/packages/flunzmas.seasoncalendar)
[<img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' height="75">](https://play.google.com/store/apps/details?id=flunzmas.seasoncalendar)

**I aim at continuously extending the languages and regions supported!**

- _Supported Languages: German, English, French, Spanish, Polish_
- _Supported Regions: Central Europe_

### Screenshots

![scr1](assets/screenshots/scr1.jpg) ![scr2](assets/screenshots/scr2.jpg)


## Features

There certainly are similar apps out there, especially within the German-speaking community.

However some distinguishing features are:

- Huge database
  - Over 100 different kinds of foods and their availability [contribute and improve information](https://github.com/Flunzmas/seasoncalendar/issues/29))
- Save favorite foods
- Modern design
- No Advertisement & No Tracking (never!)
- Runs on a variety of android devices (Android 4.1 or newer)
- [Multiple languages](https://github.com/Flunzmas/seasoncalendar/issues/36) (and comming soon [multiple regions](https://github.com/Flunzmas/seasoncalendar/issues/47))
- Free Open Soure Software

Especially the open-source aspect is a main motivating factor for me to further develop this app.

Additional info can be fetched from my website: https://flunzmas.com/seasonal-foods-calendar

## Asset Sources

The database file `assets/db/foods.db` contains all food information and their respective sources. You can open the file e.g. with ![the official SQLite DB Browser](https://sqlitebrowser.org/).

Please note that the data concerning foods' availability partly stems from ![lebensmittellexikon.de](https://lebensmittellexikon.de/) and thus is __not__ subject to the GPL license. I kindly ask you to contact me before re-using the availability data (columns starting with 'av' from the file `assets/db/foods.db`).

# Building it Yourself

0. Clone the repo
1. `flutter pub get`
2. `flutter update-packages`
3. `flutter build apk --debug --flavor <flavor>` **or** `flutter build apk --release --flavor <flavor>`

(replace `<flavor>` with `googleplay` for the Google Play version, `foss` for the full version) 
