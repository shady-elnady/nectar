import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import '../../../Product/domain/Entities/currency.dart';
import '../../../log/domain/Entities/language.dart';

class Country extends BaseEntity {
  final String? native;
  final String? svgImg;
  final String? continent;
  final String? capital;
  final dynamic flagEmoji;
  final Currency? currency;
  final Language? language;
  final String? telCode;

  const Country({
    required super.url,
    required super.name,
    this.native,
    this.svgImg,
    this.continent,
    this.capital,
    this.flagEmoji,
    this.currency,
    this.language,
    this.telCode,
    required super.slug,
  });

  @override
  String toString() {
    return 'Country(url: $url, name: $name, native: $native, svgImg: $svgImg, continent: $continent, capital: $capital, flagEmoji: $flagEmoji, currency: $currency, language: $language, telCode: $telCode, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'svg_img': svgImg,
        'continent': continent,
        'capital': capital,
        'flag_emoji': flagEmoji,
        'currency': currency?.toMap(),
        'languages': language?.toMap(),
        'tel_code': telCode,
        'slug': slug,
      };

  Country copyWith({
    required String url,
    required String name,
    String? native,
    String? svgImg,
    String? continent,
    String? capital,
    dynamic flagEmoji,
    Currency? currency,
    Language? language,
    String? telCode,
    required String slug,
  }) {
    return Country(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      svgImg: svgImg ?? this.svgImg,
      continent: continent ?? this.continent,
      capital: capital ?? this.capital,
      flagEmoji: flagEmoji ?? this.flagEmoji,
      currency: currency ?? this.currency,
      language: language ?? this.language,
      telCode: telCode ?? this.telCode,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        svgImg,
        continent,
        capital,
        flagEmoji,
        currency,
        language,
        telCode,
        slug,
      ];
}
