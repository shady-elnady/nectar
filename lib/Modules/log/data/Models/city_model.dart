import 'dart:convert';

import '../../domain/Entities/city.dart';
import 'governorate_model.dart';

class CityModel extends City {
  const CityModel({
    required super.url,
    required super.name,
    super.native,
    super.country,
    super.governorate,
    required super.slug,
  });

  factory CityModel.fromMap(Map<String, dynamic> data) => CityModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        country: data['country'] as String?,
        governorate: data['governorate'] == null
            ? null
            : GovernorateModel.fromMap(
                data['governorate'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CityModel].
  factory CityModel.fromJson(String data) {
    return CityModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
