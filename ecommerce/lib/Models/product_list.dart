import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(
    json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? image1;
  final String? image2;
  final String? image3;
  final double? price;
  final String? description;
  final String? productCode;
  final double? purity;
  final double? weight;
  final int? discount;
  final bool? isNew;
  bool isFavorite;

  ProductList({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.image1,
    this.image2,
    this.image3,
    this.description,
    this.productCode,
    this.purity,
    this.weight,
    this.discount,
    this.isNew = false,
    this.isFavorite = false,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        image1: json['image1'],
        image2: json['image2'],
        image3: json['image3'],
        description: json['description'],
        productCode: json['productCode'],
        isFavorite: json['isFavorite'],
        isNew: json['isNew'],
        purity: json['purity'],
        weight: json['weight'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "imageUrl": imageUrl,
        "description": description,
        "productCode": productCode,
        "isFavorite": isFavorite,
        "purity": purity,
        "weight": weight,
        'isNew': isNew,
      };
}
