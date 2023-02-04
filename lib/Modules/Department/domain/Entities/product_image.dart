import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  final String url;
  final String image;
  final String product;

  const ProductImage({
    required this.url,
    required this.image,
    required this.product,
  });

  @override
  String toString() {
    return 'ProductImage(url: $url, image: $image, product: $product)';
  }

  /// `dart:convert`
  ///
  /// Converts [ProductImage] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'product': product,
      };

  ProductImage copyWith({
    required String url,
    required String image,
    required String product,
  }) {
    return ProductImage(
      url: this.url,
      image: this.image,
      product: this.product,
    );
  }

  @override
  List<Object?> get props => [
        url,
        image,
        product,
      ];
}
