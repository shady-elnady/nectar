import 'dart:convert';

import '../../domain/Entities/street.dart';
import 'region_model.dart';

class StreetModel extends Street {
  const StreetModel({
    required super.url,
    required super.name,
    super.native,
    required super.region,
    required super.slug,
  });

  factory StreetModel.fromMap(Map<String, dynamic> data) => StreetModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        region: RegionModel.fromMap(data['region'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StreetModel].
  factory StreetModel.fromJson(String data) {
    return StreetModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
