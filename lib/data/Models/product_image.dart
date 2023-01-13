import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class ProductImage {
  final String? url;
  final String? image;
  final String? product;

  const ProductImage({this.url, this.image, this.product});

  @override
  String toString() {
    return 'ProductImage(url: $url, image: $image, product: $product)';
  }

  factory ProductImage.fromMap(Map<String, dynamic> data) => ProductImage(
        url: data['url'] as String?,
        image: data['image'] as String?,
        product: data['product'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'product': product,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductImage].
  factory ProductImage.fromJson(String data) {
    return ProductImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductImage] to a JSON string.
  String toJson() => json.encode(toMap());

  ProductImage copyWith({
    String? url,
    String? image,
    String? product,
  }) {
    return ProductImage(
      url: url ?? this.url,
      image: image ?? this.image,
      product: product ?? this.product,
    );
  }
}
