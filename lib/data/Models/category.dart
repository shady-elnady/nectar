import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Category {
  final String? url;
  final String name;
  final String image;
  final String? slug;
  final Category? categoryParent;

  const Category({
    this.url,
    required this.name,
    required this.image,
    this.slug,
    this.categoryParent,
  });

  @override
  String toString() {
    return 'Category(url: $url, name: $name, image: $image, slug: $slug, categoryParent: $categoryParent)';
  }

  factory Category.fromMap(Map<String, dynamic> data) => Category(
        url: data['url'] as String?,
        name: data['name'] as String,
        image: data['image'] as String,
        slug: data['slug'] as String?,
        categoryParent: data['category_parent'] == null
            ? null
            : Category.fromMap(data['category_parent'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'slug': slug,
        'category_parent': categoryParent?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Category].
  factory Category.fromJson(String data) {
    return Category.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  String toJson() => json.encode(toMap());

  Category copyWith({
    String? url,
    required String name,
    required String image,
    String? slug,
    Category? categoryParent,
  }) {
    return Category(
      url: url ?? this.url,
      name: this.name,
      image: this.image,
      slug: slug ?? this.slug,
      categoryParent: categoryParent ?? this.categoryParent,
    );
  }
}
