import 'package:flutter/material.dart';

import '../Models/models.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categories> categories = [
    Categories(
      id: 1,
      name: 'Gold',
    ),
    Categories(
      id: 2,
      name: 'Diamond',
    ),
    Categories(
      id: 3,
      name: 'Platinum',
    ),
  ];

  List<ProductCategory> productCategory = [
    ProductCategory(
        id: 1,
        categoriesId: 1,
        name: 'Rings',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/511920FCHAA00_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 2,
        categoriesId: 1,
        name: 'Earings',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/511518JCYAGA00_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 3,
        categoriesId: 2,
        name: 'Bangles',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/501772VHF1A09_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 4,
        categoriesId: 2,
        name: 'Earing',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/504002JGZABA02_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 5,
        categoriesId: 2,
        name: 'Pandant',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/500440PEAAAAPL_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 6,
        categoriesId: 3,
        name: 'Ring',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/743115FAVAA04_1.jpg?impolicy=pqmed&imwidth=100'),
    ProductCategory(
        id: 7,
        categoriesId: 3,
        name: 'Earings',
        imageUrl:
            'https://staticimg.titan.co.in/Tanishq/Catalog/743319SBBABA02_1.jpg?impolicy=pqmed&imwidth=100'),
  ];

  List<Categories> get categoriesList => categories;

  List<ProductCategory> productCategories(int categoryId) {
    List<ProductCategory> dataList = [];
    for (var item in productCategory) {
      if (item.categoriesId == categoryId) {
        dataList.add(item);
      }
    }
    return dataList;
  }
}
