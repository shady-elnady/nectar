import 'dart:convert';

import '../../domain/Entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    required super.url,
    required super.name,
    super.native,
    required super.code,
    super.emoji,
    required super.slug,
  });

  @override
  String toString() {
    return 'Currency(url: $url, name: $name, native: $native, code: $code, emoji: $emoji, slug: $slug)';
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> data) => CurrencyModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        code: data['code'] as String,
        emoji: data['emoji'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CurrencyModel].
  factory CurrencyModel.fromJson(String data) {
    return CurrencyModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
