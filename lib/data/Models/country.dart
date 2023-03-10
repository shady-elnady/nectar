// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'currency.dart';
import 'language.dart';

@immutable
class Country {
  final String? url;
  final String? name;
  final String? native;
  final String? svgImg;
  final String? continent;
  final String? capital;
  final dynamic flagEmoji;
  final Currency? currency;
  final Language? language;
  final String? telCode;
  final String? slug;

  const Country({
    this.url,
    this.name,
    this.native,
    this.svgImg,
    this.continent,
    this.capital,
    this.flagEmoji,
    this.currency,
    this.language,
    this.telCode,
    this.slug,
  });

  @override
  String toString() {
    return 'Country(url: $url, name: $name, native: $native, svgImg: $svgImg, continent: $continent, capital: $capital, flagEmoji: $flagEmoji, currency: $currency, language: $language, telCode: $telCode, slug: $slug)';
  }

  factory Country.fromMap(Map<String, dynamic> data) => Country(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        svgImg: data['svg_img'] as String?,
        continent: data['continent'] as String?,
        capital: data['capital'] as String?,
        flagEmoji: data['flag_emoji'] as dynamic,
        currency: data['currency'] == null
            ? null
            : Currency.fromMap(data['currency'] as Map<String, dynamic>),
        language: data['language'] == null
            ? null
            : Language.fromMap(data['language'] as Map<String, dynamic>),
        telCode: data['tel_code'] as String?,
        slug: data['slug'] as String?,
      );

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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  String toJson() => json.encode(toMap());

  Country copyWith({
    String? url,
    String? name,
    String? native,
    String? svgImg,
    String? continent,
    String? capital,
    dynamic flagEmoji,
    Currency? currency,
    Language? language,
    String? telCode,
    String? slug,
  }) {
    return Country(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      svgImg: svgImg ?? this.svgImg,
      continent: continent ?? this.continent,
      capital: capital ?? this.capital,
      flagEmoji: flagEmoji ?? this.flagEmoji,
      currency: currency ?? this.currency,
      language: language ?? this.language,
      telCode: telCode ?? this.telCode,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Country) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      svgImg.hashCode ^
      continent.hashCode ^
      capital.hashCode ^
      flagEmoji.hashCode ^
      currency.hashCode ^
      language.hashCode ^
      telCode.hashCode ^
      slug.hashCode;
}
