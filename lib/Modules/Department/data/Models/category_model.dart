import 'dart:convert';

import '../../domain/Entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.url,
    required super.name,
    required super.image,
    super.categoryParent,
    required super.slug,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> data) => CategoryModel(
        url: data['url'] as String,
        name: data['name'] as String,
        image: data['image'] as String,
        slug: data['slug'] as String,
        categoryParent: data['category_parent'] == null
            ? null
            : CategoryModel.fromMap(
                data['category_parent'] as Map<String, dynamic>),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryModel].
  factory CategoryModel.fromJson(String data) {
    return CategoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
