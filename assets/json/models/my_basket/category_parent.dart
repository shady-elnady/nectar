import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryParent extends Equatable {
  final String? url;
  final String? name;
  final String? image;
  final dynamic categoryParent;
  final String? slug;

  const CategoryParent({
    this.url,
    this.name,
    this.image,
    this.categoryParent,
    this.slug,
  });

  factory CategoryParent.fromMap(Map<String, dynamic> data) {
    return CategoryParent(
      url: data['url'] as String?,
      name: data['name'] as String?,
      image: data['image'] as String?,
      categoryParent: data['category_parent'] as dynamic,
      slug: data['slug'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'category_parent': categoryParent,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryParent].
  factory CategoryParent.fromJson(String data) {
    return CategoryParent.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryParent] to a JSON string.
  String toJson() => json.encode(toMap());

  CategoryParent copyWith({
    String? url,
    String? name,
    String? image,
    dynamic categoryParent,
    String? slug,
  }) {
    return CategoryParent(
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
