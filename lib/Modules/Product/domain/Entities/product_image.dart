import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

class ProductImage extends SubBaseEntity {
  final String image;
  final String product;

  const ProductImage({
    required super.url,
    required this.image,
    required this.product,
    required super.slug,
  });

  @override
  String toString() {
    return 'ProductImage(url: $url, image: $image, product: $product, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [ProductImage] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'product': product,
        'slug': slug,
      };

  ProductImage copyWith({
    required String url,
    required String image,
    required String product,
    required String slug,
  }) {
    return ProductImage(
      url: this.url,
      image: this.image,
      product: this.product,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        image,
        product,
        slug,
      ];
}
