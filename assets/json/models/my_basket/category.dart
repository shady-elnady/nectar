import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category_parent.dart';

class Category extends Equatable {
  final String? url;
  final String? name;
  final String? image;
  final CategoryParent? categoryParent;
  final String? slug;

  const Category({
    this.url,
    this.name,
    this.image,
    this.categoryParent,
    this.slug,
  });

  factory Category.fromMap(Map<String, dynamic> data) => Category(
        url: data['url'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        categoryParent: data['category_parent'] == null
            ? null
            : CategoryParent.fromMap(
                data['category_parent'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'category_parent': categoryParent?.toMap(),
        'slug': slug,
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
    String? name,
    String? image,
    CategoryParent? categoryParent,
    String? slug,
  }) {
    return Category(
      url: url ?? this.url,
      name: name ?? this.name,
      image: image ?? this.image,
      categoryParent: categoryParent ?? this.categoryParent,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, image, categoryParent, slug];
}
