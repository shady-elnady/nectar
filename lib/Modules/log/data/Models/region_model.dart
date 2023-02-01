import 'dart:convert';

import '../../domain/Entities/region.dart';
import 'city_model.dart';

class RegionModel extends Region {
  const RegionModel({
    required super.url,
    required super.name,
    required super.native,
    required super.city,
    required super.slug,
  });

  factory RegionModel.fromMap(Map<String, dynamic> data) => RegionModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String,
        city: CityModel.fromMap(data['city'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Region].
  factory RegionModel.fromJson(String data) {
    return RegionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
