# seasoncalendar

_This app is currently under construction and will be published in the Google Play Store and F-Droid repository this Summer!_

It will show you which kinds of fruit, vegetables, salads etc. are in season right now and which ones can be bought without worrying about long transport routes.

Stay tuned!

## Screenshots

![scr1](assets/screenshots/Screenshot_20200818-192031.jpg) ![scr3](assets/screenshots/Screenshot_20200818-192041.jpg)

## Asset Sources

see `assets/food_sources.xlsx` for a detailed list of where I got the food information from.

# Installation

0. Clone the repo
1. `cd seasoncalendar`.
2. `mv assets/text/imprintpagetext_template.json assets/text/imprintpagetext.json`.
3. Add your contact data if desired.
4. `flutter build appbundle` (builds a release bundle).
5. The bundle is available at `./build/app/outputs/bundle/release/app.aab`.

_Helpful info:_ https://flutter.dev/docs/deployment/android
