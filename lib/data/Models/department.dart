import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'product.dart';

@immutable
class Department {
  final String? url;
  final String name;
  final List<Product>? products;
  final bool? isFavorite;
  final String? slug;

  const Department({
    this.url,
    required this.name,
    this.products,
    this.isFavorite,
    this.slug,
  });

  @override
  String toString() {
    return 'Department(url: $url, name: $name, products: $products, isFavorite: $isFavorite, slug: $slug)';
  }

  factory Department.fromMap(Map<String, dynamic> data) => Department(
        url: data['url'] as String?,
        name: data['name'] as String,
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        isFavorite: data['is_favorite'] as bool?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'products': products?.map((e) => e.toMap()).toList(),
        'is_favorite': isFavorite,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Department].
  factory Department.fromJson(String data) {
    return Department.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Department] to a JSON string.
  String toJson() => json.encode(toMap());

  Department copyWith({
    String? url,
    required String name,
    List<Product>? products,
    bool? isFavorite,
    String? slug,
  }) {
    return Department(
      url: url ?? this.url,
      name: this.name,
      products: products ?? this.products,
      isFavorite: isFavorite ?? this.isFavorite,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Department) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      products.hashCode ^
      isFavorite.hashCode ^
      slug.hashCode;
}
