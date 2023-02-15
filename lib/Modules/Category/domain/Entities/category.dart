import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

class Category extends BaseEntityWithName {
  final String image;
  final Category? categoryParent;

  const Category({
    required super.url,
    required super.name,
    required this.image,
    this.categoryParent,
    required super.slug,
  });

  @override
  String toString() {
    return 'Category(url: $url, name: $name, image: $image, slug: $slug, categoryParent: $categoryParent)';
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'slug': slug,
        'category_parent': categoryParent?.toMap(),
      };

  Category copyWith({
    required String url,
    required String name,
    required String image,
    Category? categoryParent,
    required String slug,
  }) {
    return Category(
      url: this.url,
      name: this.name,
      image: this.image,
      categoryParent: categoryParent ?? this.categoryParent,
      slug: this.slug,
    );
  }
}
