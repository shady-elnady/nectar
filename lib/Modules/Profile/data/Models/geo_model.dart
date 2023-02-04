import 'dart:convert';

import '../../domain/Entities/geo.dart';

class GeoModel extends Geo {
  const GeoModel({
    required super.url,
    required super.lat,
    required super.lang,
    required super.slug,
  });

  factory GeoModel.fromMap(Map<String, dynamic> data) => GeoModel(
        url: data['url'] as String,
        lat: data['lat'] as double,
        lang: data['lang'] as double,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeoModel].
  factory GeoModel.fromJson(String data) {
    return GeoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
