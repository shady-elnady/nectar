import 'dart:convert';

import '../../../Product/data/Models/currency_model.dart';
import '../../../log/data/Models/language_model.dart';
import '../../domain/Entities/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.url,
    required super.name,
    super.native,
    super.svgImg,
    super.continent,
    super.capital,
    super.flagEmoji,
    super.currency,
    super.language,
    super.telCode,
    required super.slug,
  });

  factory CountryModel.fromMap(Map<String, dynamic> data) => CountryModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        svgImg: data['svg_img'] as String?,
        continent: data['continent'] as String?,
        capital: data['capital'] as String?,
        flagEmoji: data['flag_emoji'] as dynamic,
        currency: data['currency'] == null
            ? null
            : CurrencyModel.fromMap(data['currency'] as Map<String, dynamic>),
        language: data['language'] == null
            ? null
            : LanguageModel.fromMap(data['language'] as Map<String, dynamic>),
        telCode: data['tel_code'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryModel].
  factory CountryModel.fromJson(String data) {
    return CountryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
