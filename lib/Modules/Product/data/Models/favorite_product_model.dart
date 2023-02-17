import 'dart:convert';

import '../../domain/Entities/favorite_product.dart';
import 'product_model.dart';

class FavoriteProductModel extends FavoriteProduct {
  const FavoriteProductModel({
    required super.url,
    required super.product,
    required super.slug,
  });

  factory FavoriteProductModel.fromMap(Map<String, dynamic> data) {
    return FavoriteProductModel(
      url: data['url'] as String,
      product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
      slug: data['slug'] as String,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FavoriteProductModel].
  factory FavoriteProductModel.fromJson(String data) {
    return FavoriteProductModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }
}
