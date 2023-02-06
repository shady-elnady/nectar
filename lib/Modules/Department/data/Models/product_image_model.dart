import 'dart:convert';

import '../../domain/Entities/product_image.dart';

class ProductImageModel extends ProductImage {
  const ProductImageModel({
    required super.url,
    required super.image,
    required super.product,
    required super.slug,
  });

  @override
  String toString() {
    return 'ProductImage(url: $url, image: $image, product: $product)';
  }

  factory ProductImageModel.fromMap(Map<String, dynamic> data) =>
      ProductImageModel(
        url: data['url'] as String,
        image: data['image'] as String,
        product: data['product'] as String,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductImageModel].
  factory ProductImageModel.fromJson(String data) {
    return ProductImageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
