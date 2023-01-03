class SliderImage {
  final int? id;
  final String? imageUrl;

  SliderImage({
    this.id,
    this.imageUrl,
  });

  factory SliderImage.fromJson(Map<String, dynamic> json) => SliderImage(
        id: json['id'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
      };
}
