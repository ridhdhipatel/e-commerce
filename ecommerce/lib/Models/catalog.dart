class Catalog {
  Catalog({
    this.id,
    this.name,
    this.catalogImage,
    this.catalogPdf,
  });

  final int? id;
  final String? name;
  final String? catalogImage;
  final String? catalogPdf;

  factory Catalog.fromJson(Map<String, dynamic> json) {
    return Catalog(
      id: json['id'],
      name: json['name'],
      catalogImage: json['catalogImage'],
      catalogPdf: json['catalogPdf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'catalogImage': catalogImage,
      'catalogPdf': catalogPdf,
    };
  }
}
