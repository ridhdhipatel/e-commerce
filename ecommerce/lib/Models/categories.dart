class Categories {
  Categories({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;
}

class ProductCategory {
  ProductCategory({
    this.id,
    this.categoriesId,
    this.name,
    this.imageUrl,
  });

  final int? id;
  final int? categoriesId;
  final String? name;
  final String? imageUrl;
}
