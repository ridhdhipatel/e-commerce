import 'package:flutter/material.dart';

import '../Models/models.dart';

class CatalogProvider extends ChangeNotifier {
  List<Catalog> catalogs = [
    Catalog(
      id: 1,
      name: 'Striking Concentric Drop Earrings',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/51D2D1DBPABA00_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 2,
      name: 'Gorgeous Floral Pendant',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/51D1SCPDUAAA00_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 3,
      name: 'Concentric Circles Diamond Ring',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50T446FALAA02_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 4,
      name: 'A Glimpse of Lilac Ring',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFFHFAA29_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 5,
      name: 'Trendy Ring',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFFIDAA09_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 6,
      name: 'Traditional Floral Mangalsutra',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/51D2D2YDOAA00_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 7,
      name: 'Classy Pendant with Chain',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFGHYAA09_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 8,
      name: 'A Twist of Gold Bracelet',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2I2BAJAA29_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 9,
      name: 'Bold Stylish Diamond Ring for Men',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/503117FUYAA04.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
    Catalog(
      id: 10,
      name: 'Ethereal Gold and Diamond Nose Pin',
      catalogImage:
          'https://staticimg.titan.co.in/Tanishq/Catalog/500063OUAAAA09_1.jpg?impolicy=pqmed&imwidth=240',
      catalogPdf: 'https://www.africau.edu/images/default/sample.pdf',
    ),
  ];

  List<Catalog> get catalogList => catalogs;
}
