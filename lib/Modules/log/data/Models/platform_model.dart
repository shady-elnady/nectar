import 'dart:convert';

import '../../domain/Entities/platform.dart';

class PlatformModel extends Platform {
  const PlatformModel({
    required super.url,
    required super.name,
    super.native,
    required super.slug,
  });

  factory PlatformModel.fromMap(Map<String, dynamic> data) => PlatformModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlatformModel].
  factory PlatformModel.fromJson(String data) {
    return PlatformModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
