import json

foods = dict()

foods["apple"] = {
    "name": "Apfel",
    "img": "assets/img/apple.jpg",
    "infoURL": "https://de.wikipedia.org/wiki/Kulturapfel",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/apples-fruit-apple-red-apple-2923118/',
    'assetImgInfo': 'Pixabay (CC0) / Mihail_hukuna',
    'type': 'fruit',
    'local'                   : [1.0, 1.0, 1.0,  1.0, 0.5, 0.5,   0.5, 1.0, 1.0,  1.0, 1.0, 1.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['apricot'] = {
    "name": "Aprikose",
    "img": "assets/img/apricot.jpg",
    "infoURL": "https://de.wikipedia.org/wiki/Aprikose",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/apricots-apricot-tree-fruit-yellow-824626/',
    'assetImgInfo': 'Pixabay (CC0) / 1010888',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.5, 0.5, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 1.0, 1.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['pear'] = {
    "name": "Birne",
    "img": "assets/img/pear.jpg",
    "infoURL": "https://de.wikipedia.org/wiki/Birnen",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/pear-fruit-pears-2297977/',
    'assetImgInfo': 'Pixabay (CC0) / rkrl001',
    'type': 'fruit',
    'local'                   : [0.5, 0.5, 0.0,  0.0, 0.0, 0.0,   0.0, 1.0, 1.0,  1.0, 1.0, 0.5],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['blueberry'] = {
    'name': 'Heidelbeere',
    'img': 'assets/img/blueberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Heidelbeere",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/berries-blueberries-vitamins-3548239/',
    'assetImgInfo': 'Pixabay (CC0) / Heidelbergerin',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['blackberry'] = {
    'name': 'Brombeere',
    'img': 'assets/img/blackberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Brombeeren",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/blackberries-bramble-berries-bush-1539540/',
    'assetImgInfo': 'Pixabay (CC0) / pixel2013',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  0.5, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['strawberry'] = {
    'name': 'Erdbeere',
    'img': 'assets/img/strawberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Erdbeeren",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/strawberries-fruit-delicious-food-3431122/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.5, 1.0, 1.0,   1.0, 0.5, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['raspberry'] = {
    'name': 'Himbeere',
    'img': 'assets/img/raspberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Himbeere",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/raspberry-fruit-berry-red-ripe-3454504/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.5, 1.0,   1.0, 0.5, 0.5,  0.5, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['elderberry'] = {
    'name': 'Holunderbeere',
    'img': 'assets/img/elderberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Schwarzer_Holunder",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/elder-elderberries-berries-juice-4434796/',
    'assetImgInfo': 'Pixabay (CC0) / RitaE',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 1.0,  1.0, 0.0, 0.0]
}

foods['gooseberry'] = {
    'name': 'Stachelbeere',
    'img': 'assets/img/gooseberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Stachelbeere",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/gooseberry-fruits-red-summer-176450/',
    'assetImgInfo': 'Pixabay (CC0) / GLady',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   1.0, 1.0, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   1.0, 1.0, 0.5,  0.0, 0.0, 0.0]

}

foods['banana'] = {
    'name': 'Banane',
    'img': 'assets/img/banana.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Bananen",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/dessert-banana-plant-nature-leaf-3341968/',
    'assetImgInfo': 'Pixabay (CC0) / SatyaPrem',
    'type': 'fruit',
    'seaTransport'            : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['rhubarb'] = {
    'name': 'Rhabarber',
    'img': 'assets/img/rhubarb.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gemeiner_Rhabarber",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/rhubarb-fruit-spring-nature-leaves-5155214/',
    'assetImgInfo': 'Pixabay (CC0) / planet_fox',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  1.0, 1.0, 0.5,   0.5, 0.0, 0.0,  0.0, 0.0, 0.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['paprika'] = {
    'name': 'Paprika',
    'img': 'assets/img/paprika.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Paprika",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/sweet-peppers-paprika-red-healthy-499068/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  0.5, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['pineapple'] = {
    'name': 'Ananas',
    'img': 'assets/img/pineapple.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Ananas",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/pineapple-farm-garden-nature-plant-3664499/',
    'assetImgInfo': 'Pixabay (CC0) / oakdog',
    'type': 'fruit',
    'seaTransport'            : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['avocado'] = {
    'name': 'Avocado',
    'img': 'assets/img/avocado.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Avocado",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/avocado-tree-green-fruits-plant-2828639/',
    'assetImgInfo': 'Pixabay (CC0) / 5459357',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['date'] = {
    'name': 'Dattel (frisch)',
    'img': 'assets/img/jujube-date.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Echte_Dattelpalme",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/jujube-food-green-dates-date-tree-931587/',
    'assetImgInfo': 'Pixabay (CC0) / xbeing',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['fig'] = {
    'name': 'Feige',
    'img': 'assets/img/fig.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Echte_Feige",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/fig-blue-ripe-fig-tree-close-up-3622427/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['pomegranate'] = {
    'name': 'Granatapfel',
    'img': 'assets/img/pomegranate.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Granatapfel",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/fruit-leaf-food-tree-nature-3036563/',
    'assetImgInfo': 'Pixabay (CC0) / fietzfotos',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 1.0,  1.0, 1.0, 0.5],
    'flightTransport'         : [0.0, 0.0, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.0,  0.0, 0.0, 0.0]
}

foods['grapefuit'] = {
    'name': 'Grapefruit',
    'img': 'assets/img/grapefruit.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Grapefruit",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/grapefruit-fruit-red-sweet-1647688/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'fruit',
    'landTransport'           : [1.0, 1.0, 1.0,  0.5, 0.5, 0.5,   0.0, 0.0, 0.5,  1.0, 1.0, 1.0],
    'seaTransport'            : [0.0, 0.0, 0.0,  0.5, 1.0, 1.0,   1.0, 1.0, 1.0,  0.5, 0.0, 0.0]
}

foods['currant'] = {
    'name': 'Johannisbeere',
    'img': 'assets/img/currant.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Johannisbeeren",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/currants-berries-currant-fruits-3585286/',
    'assetImgInfo': 'Pixabay (CC0) / Capri23auto',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 1.0,   1.0, 1.0, 0.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 0.5,  0.0, 0.0, 0.0]
}

foods['persimmon'] = {
    'name': 'Kaki',
    'img': 'assets/img/persimmon.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kaki",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/persimmon-fruit-autumn-nature-wood-2870500/',
    'assetImgInfo': 'Pixabay (CC0) / HeungSoon',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  1.0, 1.0, 1.0],
    'seaTransport'            : [0.0, 0.0, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.0,  0.0, 0.0, 0.0]
}

foods['pricklypear'] = {
    'name': 'Kaktusfeige',
    'img': 'assets/img/prickly-pear.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Opuntia_ficus-indica",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/prickly-pear-opuntia-cactus-fruits-3763678/',
    'assetImgInfo': 'Pixabay (CC0) / manfredrichter',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['physalis'] = {
    'name': 'Physalis',
    'img': 'assets/img/physalis.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kapstachelbeere",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/physalis-fruit-berry-orange-food-3519279/',
    'assetImgInfo': 'Pixabay (CC0) / Alexas_Fotos',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 0.5,  0.5, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['starfuit'] = {
    'name': 'Sternfrucht',
    'img': 'assets/img/star-fruit.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Sternfrucht",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/star-fruit-fruit-yellow-food-1557438/',
    'assetImgInfo': 'Pixabay (CC0) / chrisad85',
    'type': 'fruit',
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['kiwi'] = {
    'name': 'Kiwi',
    'img': 'assets/img/kiwi.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kiwifrucht",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/kiwi-fruit-gold-kiwi-kiwi-tree-1565847/',
    'assetImgInfo': 'Pixabay (CC0) / Idaun',
    'type': 'fruit',
    'landTransport'           : [1.0, 1.0, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 1.0, 1.0],
    'seaTransport'            : [0.0, 0.0, 0.0,  0.0, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['coco'] = {
    'name': 'Kokosnuss',
    'img': 'assets/img/coco.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kokospalme#Kokosnuss",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/coco-coconut-palm-infrutescence-4672437/',
    'assetImgInfo': 'Pixabay (CC0) / Fernando_Hernandez',
    'type': 'fruit',
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['lychee'] = {
    'name': 'Litschi',
    'img': 'assets/img/lychee.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Litschibaum",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/arbutus-fruit-edible-vitamins-red-1771003/',
    'assetImgInfo': 'Pixabay (CC0) / siala',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   0.5, 0.5, 0.5,  0.0, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['mango'] = {
    'name': 'Mango',
    'img': 'assets/img/mango.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Mango",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/mango-mangifera-indica-about-ripe-321080/',
    'assetImgInfo': 'Pixabay (CC0) / sarangib',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 0.5,  0.5, 0.5, 0.0],
    'flightTransport'         : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['watermelon'] = {
    'name': 'Wassermelone',
    'img': 'assets/img/watermelon.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Wassermelone",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/watermelon-background-food-fruit-2636/',
    'assetImgInfo': 'Pixabay (CC0) / PublicDomainPictures',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.5,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  1.0, 0.5, 0.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.5]
}

foods['yellowplum'] = {
    'name': 'Mirabelle',
    'img': 'assets/img/yellow-plum.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Mirabelle",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/yellow-plums-fruit-tree-fruit-tree-4492322/',
    'assetImgInfo': 'Pixabay (CC0) / manfredrichter',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   1.0, 1.0, 1.0,  0.5, 0.0, 0.0]
}

foods['nectarine'] = {
    'name': 'Nektarine',
    'img': 'assets/img/nectarine.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Nektarine",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/nectarines-fruit-fresh-vitamins-4534241/',
    'assetImgInfo': 'Pixabay (CC0) / _Alicja_',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.5, 0.5, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['papaya'] = {
    'name': 'Papaya',
    'img': 'assets/img/papaya.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Papaya",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/papaya-fruit-cut-in-half-cut-1623023/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'fruit',
    'flightTransport'         : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['passionfruit'] = {
    'name': 'Passionsfrucht',
    'img': 'assets/img/passion-fruit.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Passiflora_edulis",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/passion-fruit-fruit-exotic-fruits-3759351/',
    'assetImgInfo': 'Pixabay (CC0) / RitaE',
    'type': 'fruit',
    'flightTransport'         : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['peach'] = {
    'name': 'Pfirsich',
    'img': 'assets/img/peach.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Pfirsich",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/peach-fruit-fruits-peach-tree-bio-2632182/',
    'assetImgInfo': 'Pixabay (CC0) / flockine',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.5, 0.5, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['plum'] = {
    'name': 'Pflaume',
    'img': 'assets/img/plum.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Pflaume",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/plum-bowl-fruit-food-sweet-ripe-2427588/',
    'assetImgInfo': 'Pixabay (CC0) / 32gustavsson',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 1.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0]
}

foods['prune'] = {
    'name': 'Zwetschge',
    'img': 'assets/img/prune.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Zwetschge",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/plums-fruit-ripe-branch-fruits-940100/',
    'assetImgInfo': 'Pixabay (CC0) / domeckopol',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0],
}

foods['dragonfruit'] = {
    'name': 'Drachenfrucht',
    'img': 'assets/img/dragon-fruit.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Drachenfrucht",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/dragon-fruit-fruit-pink-red-macro-3579943/',
    'assetImgInfo': 'Pixabay (CC0) / anwarajisuseno',
    'type': 'fruit',
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.5, 0.5, 0.0,  0.0, 0.0, 0.5]
}

foods['quince'] = {
    'name': 'Quitte',
    'img': 'assets/img/quince.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Quitte",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/quince-pear-quince-fruit-pome-fruit-1737596/',
    'assetImgInfo': 'Pixabay (CC0) / HelgaKa',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.5,  0.5, 0.5, 0.0]
}

foods['cherry'] = {
    'name': 'Kirsche',
    'img': 'assets/img/cherry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Vogel-Kirsche",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cherries-fruit-fruits-berries-red-3477927/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   1.0, 1.0, 0.5,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.5, 1.0,   1.0, 1.0, 0.5,  0.0, 0.0, 0.0]
}

foods['grapes'] = {
    'name': 'Traube',
    'img': 'assets/img/grapes.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Weintraube",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/purple-grapes-vineyard-napa-valley-553463/',
    'assetImgInfo': 'Pixabay (CC0) / JillWellington',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 1.0,  1.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['amla'] = {
    'name': 'Amla',
    'img': 'assets/img/amla.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Amlabaum",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/indian-gooseberry-amla-337445/',
    'assetImgInfo': 'Pixabay (CC0) / sarangib',
    'type': 'fruit',
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.5, 0.5, 0.0,  0.0, 0.0, 0.5]
}

foods['orange'] = {
    'name': 'Orange',
    'img': 'assets/img/orange.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Orange_(Frucht)",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/orange-orange-tree-citrus-fruit-3999581/',
    'assetImgInfo': 'Pixabay (CC0) / Capri23auto',
    'type': 'fruit',
    'landTransport'           : [1.0, 1.0, 1.0,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 1.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['lemon'] = {
    'name': 'Zitrone',
    'img': 'assets/img/lemon.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Zitrone",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/lemon-limone-lemon-tree-1117568/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['lime'] = {
    'name': 'Limette',
    'img': 'assets/img/lime.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Limette",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/lemon-tree-lime-green-nature-1121636/',
    'assetImgInfo': 'Pixabay (CC0) / AliceKeyStudio',
    'type': 'fruit',
    'landTransport'           : [0.3, 0.3, 0.3,  0.3, 0.3, 0.3,   0.3, 0.3, 0.3,  0.3, 0.3, 0.3],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['clementine'] = {
    'name': 'Clementine',
    'img': 'assets/img/clementine.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Mandarine",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/clementines-fruit-vitamins-318210/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'fruit',
    'landTransport'           : [0.5, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 1.0, 1.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['honeymelon'] = {
    'name': 'Zuckermelonen',
    'img': 'assets/img/honey-melon.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Zuckermelone",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/melon-honey-dew-melon-breakfast-4360538/',
    'assetImgInfo': 'Pixabay (CC0) / JillWellington',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.5, 1.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['nashi'] = {
    'name': 'Nashi',
    'img': 'assets/img/nashi.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Nashi-Birne",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/pears-pears-nashi-pears-japanese-2706253/',
    'assetImgInfo': 'Pixabay (CC0) / Weblab24_Siti_Web',
    'type': 'fruit',
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['carob'] = {
    'name': 'Johannisbrot',
    'img': 'assets/img/carob.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Johannisbrotbaum",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/carob-tree-legumes-leaves-branch-7328/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.5,  0.5, 0.5, 0.0]
}

foods['chestnut'] = {
    'name': 'Kastanie',
    'img': 'assets/img/chestnut.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Edelkastanie",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/chestnut-sweet-chestnuts-maroni-3769296/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.5,  1.0, 0.5, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.5]
}

foods['rosehip'] = {
    'name': 'Hagebutte',
    'img': 'assets/img/rosehip.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Hagebutte",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/rosehips-berry-branch-plant-red-285436/',
    'assetImgInfo': 'Pixabay (CC0) / hajninjah',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.0]
}

foods['guava'] = {
    'name': 'Guave',
    'img': 'assets/img/guava.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Echte_Guave",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/guava-green-fruit-branch-fruit-144145/',
    'assetImgInfo': 'Pixabay (CC0) / Ashish_Choudhary',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.3, 0.3, 0.3],
    'flightTransport'         : [0.5, 0.0, 0.5,  0.5, 0.5, 0.5,   0.0, 0.0, 0.5,  0.5, 0.5, 0.5]
}

foods['wildstrawberry'] = {
    'name': 'Walderdbeere',
    'img': 'assets/img/wildstrawberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Wald-Erdbeere",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/strawberry-wild-strawberry-red-7649/',
    'assetImgInfo': 'Pixabay (CC0) / LoggaWiggler',
    'type': 'fruit',
    'landTransport'           : [0.3, 0.0, 0.0,  0.0, 0.0, 0.0,   0.3, 0.3, 0.3,  0.0, 0.3, 0.3],
}

foods['sorb'] = {
    'name': 'Eberesche',
    'img': 'assets/img/sorb.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Vogelbeere",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/rowan-sorb-rowan-tree-mountain-ash-1575141/',
    'assetImgInfo': 'Pixabay (CC0) / Lindasay',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.3, 0.3,  0.3, 0.0, 0.0],
}

foods['cranberry'] = {
    'name': 'Cranberry',
    'img': 'assets/img/cranberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gro%C3%9Ffr%C3%BCchtige_Moosbeere",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cranberries-berries-forest-floor-2907901/',
    'assetImgInfo': 'Pixabay (CC0) / fotoblend',
    'type': 'fruit',
    'flightTransport'         : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.5,  0.5, 0.5, 0.5],
}

foods['cloudberry'] = {
    'name': 'Moltebeere',
    'img': 'assets/img/cloudberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Moltebeere",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cloudberry-bush-produces-berries-2130046/',
    'assetImgInfo': 'Pixabay (CC0) / IK3',
    'type': 'fruit',
    'landTransport'           : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.3, 0.3, 0.0,  0.0, 0.0, 0.0],
}

foods['lingonberry'] = {
    'name': 'Preiselbeere',
    'img': 'assets/img/lingonberry.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Preiselbeere",
    'isCommon': 0,
    'assetImgSourceUrl': 'https://pixabay.com/photos/lingonberry-cowberry-640978/',
    'assetImgInfo': 'Pixabay (CC0) / ChadoNihi',
    'type': 'fruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 0.5,  0.5, 0.0, 0.0],
}

foods['eggplant'] = {
    'name': 'Aubergine',
    'img': 'assets/img/eggplant.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Aubergine",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/ripe-eggplant-eggplant-vegetable-2759947/',
    'assetImgInfo': 'Pixabay (CC0) / leoleobobeo',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.5, 0.5,  0.5, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['batavia'] = {
    'name': 'Bataviasalat',
    'img': 'assets/img/batavia.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Eisbergsalat#Geschichte",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/green-salad-lettuce-batavia-1533956/',
    'assetImgInfo': 'Pixabay (CC0) / juliacasado1',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.5, 0.5,   0.5, 0.5, 0.0,  0.0, 0.0, 0.0]
}

foods['spinach'] = {
    'name': 'Spinat',
    'img': 'assets/img/spinach.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Spinat",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/spinach-plant-nutrition-eat-fresh-2216967/',
    'assetImgInfo': 'Pixabay (CC0) / ThiloBecker',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['celery-green'] = {
    'name': 'Staudensellerie',
    'img': 'assets/img/celery-green.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Echter_Sellerie#Staudensellerie",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/vegetables-celery-green-vitamins-5040035/',
    'assetImgInfo': 'Pixabay (CC0) / pasja1000',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  1.0, 0.5, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['cauliflower'] = {
    'name': 'Blumenkohl',
    'img': 'assets/img/cauliflower.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Blumenkohl",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cauliflower-vegetables-food-1465732/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.5, 1.0,   1.0, 1.0, 1.0,  0.5, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['greenbeans'] = {
    'name': 'Bohnen',
    'img': 'assets/img/green-beans.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gartenbohne",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/vegetable-string-green-bean-food-642119/',
    'assetImgInfo': 'Pixabay (CC0) / Free-Photos',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.5, 1.0, 1.0,   1.0, 1.0, 0.5,  0.0, 0.0, 0.0],
}

foods['broccoli'] = {
    'name': 'Brokkoli',
    'img': 'assets/img/broccoli.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Brokkoli",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/broccoli-vegetables-healthy-cook-1974764/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 1.0, 1.0,  0.5, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['champignon'] = {
    'name': 'Champignons',
    'img': 'assets/img/champignon.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Champignons",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/mushroom-mushrooms-food-champignon-3286258/',
    'assetImgInfo': 'Pixabay (CC0) / Laila_',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['chicory'] = {
    'name': 'Chicorée',
    'img': 'assets/img/chicory.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Chicor%C3%A9e",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/chicory-chicory-roots-vegetables-2945440/',
    'assetImgInfo': 'Pixabay (CC0) / David_Will',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.5]
}

foods['iceberg'] = {
    'name': 'Eisbergsalat',
    'img': 'assets/img/iceberg-salad.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Eisbergsalat",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/salad-head-of-lettuce-3505392/',
    'assetImgInfo': 'Pixabay (CC0) / Pezibear',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 1.0,   1.0, 1.0, 1.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.0, 0.0, 0.0,  0.0, 0.5, 0.5]
}

foods['endive'] = {
    'name': 'Endivie',
    'img': 'assets/img/endive-salad.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Endivie",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/salad-iceberg-lettuce-lettuce-leaves-4557206/',
    'assetImgInfo': 'Pixabay (CC0) / anaterate',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.5]
}

foods['fieldsalad'] = {
    'name': 'Feldsalat',
    'img': 'assets/img/field-salad.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gew%C3%B6hnlicher_Feldsalat",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/salad-lamb-s-lettuce-lettuce-leaves-264826/',
    'assetImgInfo': 'Pixabay (CC0) / ejaugsburg',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.5]
}

foods['headlettuce'] = {
    'name': 'Kopfsalat',
    'img': 'assets/img/head-lettuce.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kopfsalat",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/salad-head-of-lettuce-green-salad-5335862/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.0, 0.0]
}

foods['lollorossa'] = {
    'name': 'Lollo Rossa',
    'img': 'assets/img/lollo-rossa.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Schnittsalat",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/lollo-rossa-lollo-rosso-salad-1619268/',
    'assetImgInfo': 'Pixabay (CC0) / hansbenn',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.5]
}

foods['radicchio'] = {
    'name': 'Radicchio',
    'img': 'assets/img/radicchio.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Radicchio",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/search/user:hans%20radicchio/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'nonFruit',
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.5]
}

foods['chinesecabbage'] = {
    'name': 'Chinakohl',
    'img': 'assets/img/napa-cabbage.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Chinakohl",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://commons.wikimedia.org/wiki/File:NAPA_cabbage_at_Asian_supermarket_in_New_Jersey.jpg',
    'assetImgInfo': 'Wikimedia (CC0) / Tomwsulcer',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['peas'] = {
    'name': 'Erbsen',
    'img': 'assets/img/peas.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Erbse",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/textures-background-fresh-peas-1938301/',
    'assetImgInfo': 'Pixabay (CC0) / piviso',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   0.5, 0.5, 0.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['fennel'] = {
    'name': 'Fenchel',
    'img': 'assets/img/fennel.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Fenchel",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/fennel-vegetables-fennel-bulb-food-1311691/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 1.0, 1.0,  1.0, 0.5, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['greenonion'] = {
    'name': 'Grüne Zwiebeln',
    'img': 'assets/img/green-onion.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Winterzwiebel",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/green-onion-spring-onions-vegetables-699943/',
    'assetImgInfo': 'Pixabay (CC0) / ArmbrustAnna',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['sweetcorn'] = {
    'name': 'Mais',
    'img': 'assets/img/sweet-corn.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Mais",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/sweet-corn-vegetables-food-3705687/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.5, 0.5, 0.5,  0.5, 0.5, 0.0]
}

foods['greencabbage'] = {
    'name': 'Grünkohl',
    'img': 'assets/img/green-cabbage.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gr%C3%BCnkohl",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cabbage-vegetable-kale-green-dew-1850722/',
    'assetImgInfo': 'Pixabay (CC0) / Pexels',
    'type': 'nonFruit',
    'local'                   : [1.0, 1.0, 0.5,  0.0, 0.0, 0.0,   0.0, 0.0, 0.5,  1.0, 1.0, 1.0]
}

foods['cucumber'] = {
    'name': 'Gurken',
    'img': 'assets/img/cucumber.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gurke",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/cucumber-cucumber-background-5318945/',
    'assetImgInfo': 'Pixabay (CC0) / outsideclick',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 1.0, 1.0,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['potato'] = {
    'name': 'Kartoffel',
    'img': 'assets/img/potato.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kartoffel",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/potatoes-vegetables-erdfrucht-bio-1585060/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  1.0, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'seaTransport'            : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['carrot'] = {
    'name': 'Karotte',
    'img': 'assets/img/carrot.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Karotte",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/carrots-vegetables-harvest-healthy-2387394/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 0.5, 1.0,   1.0, 1.0, 1.0,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['celery'] = {
    'name': 'Knollensellerie',
    'img': 'assets/img/celery.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Echter_Sellerie#Knollensellerie",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/celery-celeriac-vegetables-turnip-228002/',
    'assetImgInfo': 'Pixabay (CC0) / Hans',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['kohlrabi'] = {
    'name': 'Kohlrabi',
    'img': 'assets/img/kohlrabi.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Kohlrabi",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/kohlrabi-vegetables-food-kohl-eat-176849/',
    'assetImgInfo': 'Pixabay (CC0) / HolgersFotografie',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['leek'] = {
    'name': 'Lauch',
    'img': 'assets/img/leek.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Lauch",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/leek-vegetables-raw-food-healthy-1291340/',
    'assetImgInfo': 'Pixabay (CC0) / Couleur',
    'type': 'nonFruit',
    'local'                   : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['chard'] = {
    'name': 'Mangold',
    'img': 'assets/img/chard.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Mangold",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/plant-mangel-kale-food-healthy-690051/',
    'assetImgInfo': 'Pixabay (CC0) / Free_Photos',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0]
}

foods['parsnip'] = {
    'name': 'Pastinake',
    'img': 'assets/img/parsnips.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Pastinak",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/parsnips-root-vegetables-3860993/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'nonFruit',
    'local'                   : [1.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 1.0, 1.0],
    'landTransport'           : [1.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  1.0, 1.0, 1.0]
}

foods['smallradish'] = {
    'name': 'Radieschen',
    'img': 'assets/img/small-radish.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Radieschen",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/radish-vegetable-root-salad-1537141/',
    'assetImgInfo': 'Pixabay (CC0) / stevepb',
    'type': 'nonFruit',
    'local'                   : [0.5, 0.5, 0.5,  0.5, 1.0, 1.0,   1.0, 0.5, 0.5,  0.5, 0.5, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['radish'] = {
    'name': 'Rettich',
    'img': 'assets/img/radish.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Rettiche",
    'isCommon': 1,
    'assetImgSourceUrl': 'nicht mehr vorhanden',
    'assetImgInfo': 'Pixabay (CC0) / Ralf Roletschek',
    'type': 'nonFruit',
    'local'                   : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['brusselssprouts'] = {
    'name': 'Rosenkohl',
    'img': 'assets/img/brussels-sprouts.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Rosenkohl",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/brussels-sprouts-green-round-raw-3100702/',
    'assetImgInfo': 'Pixabay (CC0) / ulleo',
    'type': 'nonFruit',
    'local'                   : [1.0, 0.5, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  1.0, 1.0, 1.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.5, 0.5, 0.5]
}

foods['beetroot'] = {
    'name': 'Rote Bete',
    'img': 'assets/img/beetroot.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Rote_Bete",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/beetroot-food-diet-vegetable-687251/',
    'assetImgInfo': 'Pixabay (CC0) / Desertrose7',
    'type': 'nonFruit',
    'local'                   : [1.0, 1.0, 1.0,  0.5, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0]
}

foods['purplecabbage'] = {
    'name': 'Rotkohl',
    'img': 'assets/img/purple-cabbage.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Rotkohl",
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/the-purple-cabbage-purple-cabbage-5318959/',
    'assetImgInfo': 'Pixabay (CC0) / outsideclick',
    'type': 'nonFruit',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.5,   0.5, 0.5, 1.0,  1.0, 1.0, 1.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['asparagus'] = {
    'name': 'Spargel',
    'img': 'assets/img/asparagus.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Gem%C3%BCsespargel",
    'type': 'nonFruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/vegetable-asparagus-market-740446/',
    'assetImgInfo': 'Pixabay (CC0) / jackmac34',
    'local'                   : [0.0, 0.0, 0.0,  1.0, 1.0, 1.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.0],
    'landTransport'           : [0.0, 0.0, 0.5,  0.5, 0.5, 0.5,   0.0, 0.0, 0.0,  0.0, 0.0, 0.0],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.0, 0.0, 0.0,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['pointedcabbage'] = {
    'name': 'Spitzkohl',
    'img': 'assets/img/pointed-cabbage.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Spitzkohl",
    'type': 'nonFruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/pointed-cabbage-kohl-food-3450420/',
    'assetImgInfo': 'Pixabay (CC0) / StephanieAlbert',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['tomato'] = {
    'name': 'Tomate',
    'img': 'assets/img/tomato.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Tomate",
    'type': 'fruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/tomato-plant-food-vegetables-2643774/',
    'assetImgInfo': 'Pixabay (CC0) / axelmellin',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5],
    'flightTransport'         : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['whitecabbage'] = {
    'name': 'Weißkohl',
    'img': 'assets/img/white-cabbage.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Wei%C3%9Fkohl",
    'type': 'nonFruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/white-cabbage-vegetables-food-4276765/',
    'assetImgInfo': 'Pixabay (CC0) / stanbalik',
    'local'                   : [1.0, 1.0, 1.0,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 1.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['savoy'] = {
    'name': 'Wirsing',
    'img': 'assets/img/savoy.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Wirsing",
    'type': 'nonFruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/savoy-plant-vegetables-5275838/',
    'assetImgInfo': 'Pixabay (CC0) / birgl',
    'local'                   : [0.5, 0.5, 0.5,  1.0, 1.0, 1.0,   1.0, 1.0, 1.0,  1.0, 1.0, 0.5],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

foods['zucchini'] = {
    'name': 'Zucchini',
    'img': 'assets/img/zucchini.jpg',
    "infoURL": "https://de.wikipedia.org/wiki/Zucchini",
    'type': 'nonFruit',
    'isCommon': 1,
    'assetImgSourceUrl': 'https://pixabay.com/photos/zucchini-vegetables-harvest-garden-1659094/',
    'assetImgInfo': 'Pixabay (CC0) / congerdesign',
    'local'                   : [0.0, 0.0, 0.0,  0.0, 0.0, 1.0,   1.0, 1.0, 1.0,  1.0, 0.0, 0.0],
    'landTransport'           : [0.5, 0.5, 0.5,  0.5, 0.5, 0.5,   0.5, 0.5, 0.5,  0.5, 0.5, 0.5]
}

json.dump(foods, open("foods.json", "w"))


import sqlite3

conn = sqlite3.connect('db/foods.db')
c = conn.cursor()

for foodkey in foods.keys():

    for mode in ['local', 'landTransport', 'seaTransport', 'flightTransport']:
        if not mode in foods[foodkey].keys():
            foods[foodkey][mode] = [0.0, 0.0, 0.0,  0.0, 0.0, 0.0,   0.0, 0.0, 0.0,  0.0, 0.0, 0.0]

    execution_string = str("INSERT INTO foods VALUES ('{0}','{1}','{2}','{3}', {4}, '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}')".format
    (
        foodkey,
        foods[foodkey]['name'],
        foods[foodkey]['name'],  # synonyms
        foods[foodkey]['type'],
        foods[foodkey]['isCommon'],  
        str(foods[foodkey]['local'])[1:-1],
        str(foods[foodkey]['landTransport'])[1:-1],
        str(foods[foodkey]['seaTransport'])[1:-1],
        str(foods[foodkey]['flightTransport'])[1:-1],
        foods[foodkey]['infoURL'],
        foods[foodkey]['img'],
        foods[foodkey]['assetImgSourceUrl'],
        foods[foodkey]['assetImgInfo'],
    ))

    print(execution_string)
    #  exit(0)

    c.execute(execution_string)

# Save (commit) the changes
conn.commit()

# We can also close the connection if we are done with it.
# Just be sure any changes have been committed or they will be lost.
conn.close()