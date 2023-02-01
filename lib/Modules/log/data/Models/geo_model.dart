import 'dart:convert';

import '../../domain/Entities/geo.dart';

class GeoModel extends Geo {
  const GeoModel({
    required super.lat,
    required super.lang,
  });

  factory GeoModel.fromMap(Map<String, dynamic> data) => GeoModel(
        lat: data['lat'] as int,
        lang: data['lang'] as int,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeoModel].
  factory GeoModel.fromJson(String data) {
    return GeoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
