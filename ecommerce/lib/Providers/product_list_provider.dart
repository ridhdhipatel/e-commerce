import 'package:flutter/material.dart';

import '../Models/models.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductList> products = [
    ProductList(
      id: 1,
      name: 'Pop of Purple Hoop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFHGXAAA29_1.jpg?impolicy=pqmed&imwidth=240',
      image1:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFHGXAAA29_1.jpg',
      image2:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFHGXAAA29_2.jpg',
      image3:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFHGXAAA29_3.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim lobortis scelerisque fermentum dui faucibus. Vulputate ut pharetra sit amet aliquam id.',
      productCode: 'P00101',
      price: 35613,
      purity: 22.5,
      weight: 5.0,
      isNew: true,
      discount: 5,
    ),
    ProductList(
      id: 2,
      name: 'Plum & Perfect Drop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDGTAGA29_1.jpg?impolicy=pqmed&imwidth=240',
      image1:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDGTAGA29_1.jpg',
      image2:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDGTAGA29_2.jpg',
      image3:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDGTAGA29_1.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Molestie at elementum eu facilisis sed odio morbi quis. Mi bibendum neque egestas congue quisque egestas diam in.',
      price: 48340,
      productCode: 'P00102',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 10,
    ),
    ProductList(
      id: 3,
      name: 'Elegant Floral Diamond Stud Earrings With Rock Crystal',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/501720SASADA32_1.jpg?impolicy=pqmed&imwidth=240',
      image1:
          'https://staticimg.titan.co.in/Tanishq/Catalog/501720SASADA32_1.jpg',
      image2:
          'https://staticimg.titan.co.in/Tanishq/Catalog/501720SASADA32_2.jpg',
      image3:
          'https://staticimg.titan.co.in/Tanishq/Catalog/501720SASADA32_1.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed nisi lacus sed viverra tellus in hac habitasse platea. Viverra suspendisse potenti nullam ac.',
      price: 25796,
      productCode: 'P00103',
      purity: 22.5,
      weight: 5.0,
      isNew: true,
    ),
    ProductList(
      id: 4,
      name: 'Sophisticated Stud Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_1.jpg?impolicy=pqmed&imwidth=240',
      image1:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_1.jpg',
      image2:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_2.jpg',
      image3:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_3.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing elit duis tristique sollicitudin nibh sit amet. Odio euismod lacinia at quis risus sed vulputate odio ut.',
      price: 39628,
      productCode: 'P00104',
      purity: 22.5,
      weight: 5.0,
      isNew: true,
    ),
    ProductList(
      id: 5,
      name: 'Vivacious Drop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDIZAGA09.jpg?impolicy=pqmed&imwidth=240',
      image1:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDIZAGA09.jpg',
      image2:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDIZAGA09_1.jpg',
      image3:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFDIZAGA09_2.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus nulla at volutpat diam. Sagittis orci a scelerisque purus semper.',
      price: 49015,
      productCode: 'P00105',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 15,
    ),
    ProductList(
      id: 6,
      name: 'A-Symmetric Affair Drop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/50D2I2DNLADA29.jpg?impolicy=pqmed&imwidth=240',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non odio euismod lacinia at quis risus. Donec ac odio tempor orci dapibus ultrices in iaculis.',
      price: 33292,
      productCode: 'P00106',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 20,
    ),
    ProductList(
      id: 7,
      name: 'Exotic Diamond Floral Stud Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/743319SBAABA02_1.jpg?impolicy=pqmed&imwidth=240',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing commodo elit at imperdiet dui. Tristique senectus et netus et malesuada.',
      price: 32620,
      productCode: 'P00107',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 25,
    ),
    ProductList(
      id: 8,
      name: 'Dainty Leaf Diamond Hoop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/502118HBEABA09_1.jpg?impolicy=pqmed&imwidth=240',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Mattis pellentesque id nibh tortor id aliquet.',
      price: 34754,
      productCode: 'P00108',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 2,
    ),
    ProductList(
      id: 9,
      name: 'Striking Concentric Drop Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/51D2D1DBPABA00_1.jpg?impolicy=pqmed&imwidth=240',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Pellentesque nec nam aliquam sem et.',
      price: 45050,
      productCode: 'P00109',
      purity: 22.5,
      weight: 5.0,
      isNew: true,
    ),
    ProductList(
      id: 10,
      name: 'Flowerbud Pearl Stud Earrings',
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Catalog/500109SDAABAPL_1.jpg?impolicy=pqmed&imwidth=240',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tortor vitae purus faucibus ornare suspendisse sed. Tellus elementum sagittis vitae et leo duis ut.',
      price: 15210,
      productCode: 'P00110',
      purity: 22.5,
      weight: 5.0,
      isNew: false,
      discount: 5,
    ),
  ];

  List<ProductList> get productList => products;

  ProductList getProduct(int id) {
    return productList.firstWhere((product) => product.id == id);
  }
}
