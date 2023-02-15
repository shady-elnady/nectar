import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  final String? url;
  final String? product;
  final String? image;
  final String? slug;

  const ProductImage({this.url, this.product, this.image, this.slug});

  factory ProductImage.fromMap(Map<String, dynamic> data) => ProductImage(
        url: data['url'] as String?,
        product: data['product'] as String?,
        image: data['image'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'product': product,
        'image': image,
        'slug': slug,
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
    String? product,
    String? image,
    String? slug,
  }) {
    return ProductImage(
      url: url ?? this.url,
      product: product ?? this.product,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, product, image, slug];
}
