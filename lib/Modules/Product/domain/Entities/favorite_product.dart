import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import 'product.dart';

class FavoriteProduct extends SubBaseEntity {
  final Product product;

  const FavoriteProduct({
    required super.url,
    required this.product,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'product': product.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [FavoriteProduct] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  FavoriteProduct copyWith({
    required String url,
    required Product product,
    required String slug,
  }) {
    return FavoriteProduct(
      url: this.url,
      product: this.product,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        product,
        slug,
      ];
}
