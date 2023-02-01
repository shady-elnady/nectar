import 'dart:convert';

import '../../domain/Entities/language.dart';
import 'applicatins_model.dart';

class LanguageModel extends Language {
  const LanguageModel({
    required super.url,
    required super.name,
    required super.native,
    required super.iso6391,
    super.emoji,
    required super.isRtl,
    super.applicatinsSupport,
    required super.slug,
  });

  factory LanguageModel.fromMap(Map<String, dynamic> data) => LanguageModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String,
        iso6391: data['iso_639_1'] as String,
        emoji: data['emoji'] as String?,
        isRtl: data['is_rtl'] as bool,
        applicatinsSupport: (data['applicatins_support'] as List<dynamic>?)
            ?.map((e) => ApplicationModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LanguageModel].
  factory LanguageModel.fromJson(String data) {
    return LanguageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
