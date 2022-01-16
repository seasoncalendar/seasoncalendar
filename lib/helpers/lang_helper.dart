import 'package:intl/intl.dart';

// look into the package flutter_localized_locales ?
final Map<String, String> languageNameFromCode = {
  "aa": "Qafaraf",
  "ab": "Аҧсуа бызшәа Aƥsua bızšwa",
  "af": "Afrikaans",
  "ak": "Akan",
  "am": "አማርኛ Amârıñâ",
  "an": "aragonés",
  "ar": "العَرَبِيَّة al'Arabiyyeẗ",
  "as": "অসমীয়া",
  "av": "Магӏарул мацӏ",
  "ay": "Aymar aru",
  "az": "Azərbaycan dili",
  "ba": "Башҡорт теле",
  "be": "Беларуская мова Belaruskaâ mova",
  "bg": "български език bălgarski ezik",
  "bm": "ߓߊߡߊߣߊߣߞߊߣ",
  "bn": "বাংলা Bāŋlā",
  "bo": "བོད་སྐད་ Bodskad",
  "br": "Brezhoneg",
  "bs": "bosanski",
  "ca": "català,valencià",
  "ce": "Нохчийн мотт",
  "ch": "Finu' Chamoru",
  "co": "Corsu; Lingua corsa",
  "cs": "čeština",
  "cu": "Славе́нскїй ѧ҆зы́къ",
  "cv": "Чӑвашла",
  "cy": "Cymraeg",
  "da": "dansk",
  "de": "Deutsch",
  "dv": "ދިވެހި; ދިވެހިބަސް Divehi",
  "dz": "རྫོང་ཁ་ Ĵoŋkha",
  "ee": "Èʋegbe",
  "el": "Νέα Ελληνικά Néa Ellêniká",
  "en": "English",
  "eo": "Esperanto",
  "es": "español",
  "et": "eesti keel",
  "eu": "euskara",
  "fa": "فارسی Fārsiy",
  "ff": "Fulfulde",
  "fi": "suomen kieli",
  "fj": "Na Vosa Vakaviti",
  "fo": "føroyskt",
  "fr": "français",
  "fy": "Frysk",
  "ga": "Gaeilge",
  "gd": "Gàidhlig",
  "gl": "galego",
  "gn": "Avañe'ẽ",
  "gu": "ગુજરાતી Gujarātī",
  "gv": "Gaelg; Gailck",
  "ha": "Harshen Hausa",
  "he": "עברית 'Ivriyþ",
  "hi": "हिन्दी Hindī",
  "hr": "hrvatski",
  "ht": "kreyòl ayisyen",
  "hu": "magyar nyelv",
  "hy": "Հայերէն Hayerèn",
  "hz": "Otjiherero",
  "id": "bahasa Indonesia",
  "ig": "Asụsụ Igbo",
  "ii": "ꆈꌠꉙ Nuosuhxop",
  "ik": "Iñupiaq",
  "is": "íslenska",
  "it": "italiano",
  "iu": "ᐃᓄᒃᑎᑐᑦ Inuktitut",
  "ja": "日本語 Nihongo",
  "jv": "ꦧꦱꦗꦮ / Basa Jawa",
  "ka": "ქართული Kharthuli",
  "ki": "Gĩkũyũ",
  "kk": "қазақ тілі qazaq tili",
  "km": "ភាសាខ្មែរ Phiəsaakhmær",
  "kn": "ಕನ್ನಡ Kannađa",
  "ko": "한국어 Han'gug'ô",
  "ks": "कॉशुर / كأشُر",
  "ku": "kurdî / کوردی",
  "kv": "Коми кыв",
  "kw": "Kernowek",
  "ky": "кыргызча kırgızça",
  "la": "Lingua latīna",
  "lb": "Lëtzebuergesch",
  "lg": "Luganda",
  "li": "Lèmburgs",
  "lo": "ພາສາລາວ Phasalaw",
  "lt": "lietuvių kalba",
  "lu": "Kiluba",
  "lv": "Latviešu valoda",
  "mh": "Kajin M̧ajeļ",
  "mi": "Te Reo Māori",
  "mk": "македонски јазик makedonski jazik",
  "ml": "മലയാളം Malayāļã",
  "mn": "монгол хэл mongol xel",
  "mr": "मराठी Marāţhī",
  "ms": "Bahasa Melayu",
  "mt": "Malti",
  "my": "မြန်မာစာ Mrãmācā",
  "na": "dorerin Naoero",
  "nb": "norsk bokmål",
  "nd": "siNdebele saseNyakatho",
  "ne": "नेपाली भाषा Nepālī bhāśā",
  "ng": "ndonga",
  "nl": "Nederlands",
  "nn": "norsk nynorsk",
  "no": "norsk",
  "nr": "isiNdebele seSewula",
  "nv": "Diné bizaad",
  "ny": "Chichewa",
  "oc": "occitan",
  "om": "Afaan Oromoo",
  "or": "ଓଡ଼ିଆ",
  "os": "Ирон æвзаг Iron ævzag",
  "pa": "ਪੰਜਾਬੀ / پنجابی Pãjābī",
  "pi": "Pāli",
  "pl": "Język polski",
  "ps": "پښتو Pax̌tow",
  "pt": "português",
  "qu": "Runa simi",
  "rm": "Rumantsch",
  "rn": "Ikirundi",
  "ro": "limba română",
  "ru": "русский язык russkiĭ âzık",
  "rw": "Ikinyarwanda",
  "sa": "संस्कृतम् Sąskŕtam",
  "sc": "sardu",
  "sd": "سنڌي / सिन्धी / ਸਿੰਧੀ",
  "se": "davvisámegiella",
  "sg": "yângâ tî sängö",
  "si": "සිංහල Sĩhala",
  "sk": "slovenčina",
  "sl": "slovenski jezik",
  "sm": "Gagana faʻa Sāmoa",
  "sn": "chiShona",
  "so": "af Soomaali",
  "sq": "Shqip",
  "sr": "српски / srpski",
  "ss": "siSwati",
  "st": "Sesotho [southern]",
  "su": "Basa Sunda",
  "sv": "svenska",
  "sw": "Kiswahili",
  "ta": "தமிழ் Tamił",
  "te": "తెలుగు Telugu",
  "tg": "тоҷикӣ toçikī",
  "th": "ภาษาไทย Phasathay",
  "ti": "ትግርኛ",
  "tk": "Türkmençe / Түркменче / تورکمن تیلی تورکمنچ",
  "tl": "Wikang Tagalog",
  "tn": "Setswana",
  "to": "lea faka-Tonga",
  "tr": "Türkçe",
  "ts": "Xitsonga",
  "tt": "татар теле / tatar tele / تاتار",
  "ty": "Reo Tahiti; Reo Mā'ohi",
  "ug": "ئۇيغۇرچە ",
  "uk": "Українська мова; Українська",
  "ur": "اُردُو Urduw",
  "uz": "Oʻzbekcha / Ózbekça / ўзбекча / ئوزبېچه",
  "ve": "Tshivenḓa",
  "vi": "Tiếng Việt",
  "wa": "Walon",
  "xh": "isiXhosa",
  "yi": "ייִדיש",
  "yo": "èdè Yorùbá",
  "za": "Vahcuengh / 話僮",
  "zh": "中文 Zhōngwén",
  "zu": "isiZulu"
};

// languages not in this list will be marked as BETA
final List<String> completeLanguages = [
  "en",
  "de",
  "fr",
  "pl",
  "es",
  "it",
  "nl",
  "bg"
];
final List<String> nonDisplayableLanguages = ["eo"];

String getTranslationByKey(String key, {String fallbackLocale = "en"}) {
  String res = Intl.message('', name: key);
  if (res == '') {
    res = Intl.message('UNKNOWN', name: key, locale: fallbackLocale);
  }
  return res;
}
