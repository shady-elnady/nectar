import 'dart:convert';

import '../../domain/Entities/governorate.dart';
import 'country_model.dart';

class GovernorateModel extends Governorate {
  const GovernorateModel({
    required super.url,
    required super.name,
    super.native,
    super.telCode,
    super.country,
    required super.slug,
  });

  factory GovernorateModel.fromMap(Map<String, dynamic> data) =>
      GovernorateModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        telCode: data['tel_code'] as String?,
        country: data['country'] == null
            ? null
            : CountryModel.fromMap(data['country'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GovernorateModel].
  factory GovernorateModel.fromJson(String data) {
    return GovernorateModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
