import 'dart:convert';

import '../../domain/Entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({
    required super.url,
    required super.name,
    super.image,
    required super.slug,
  });
  factory BrandModel.fromMap(Map<String, dynamic> data) => BrandModel(
        url: data['url'] as String,
        name: data['name'] as String,
        image: data['image'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BrandModel].
  factory BrandModel.fromJson(String data) {
    return BrandModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
