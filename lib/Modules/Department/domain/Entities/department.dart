import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';
import '../../../Product/domain/Entities/product.dart';

class Department extends BaseEntityWithName {
  final List<Product?> products;
  final bool? isFavorite;

  const Department({
    required super.url,
    required super.name,
    required this.products,
    this.isFavorite,
    required super.slug,
  });

  @override
  String toString() {
    return 'Department(url: $url, name: $name, products: $products, isFavorite: $isFavorite, slug: $slug)';
  }

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'products': products.map((e) => e!.toMap()).toList(),
        'is_favorite': isFavorite,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Department] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Department copyWith({
    required String url,
    required String name,
    List<Product>? products,
    bool? isFavorite,
    required String slug,
  }) {
    return Department(
      url: this.url,
      name: this.name,
      products: products ?? this.products,
      isFavorite: isFavorite ?? this.isFavorite,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        products,
        isFavorite,
        slug,
      ];
}
