import 'dart:convert';

import 'currency_model.dart';
import 'language_model.dart';

class Country {
  Country({
    this.url,
    required this.name,
    this.native,
    this.svgImg,
    required this.continent,
    this.capital,
    this.flagEmoji,
    this.currency,
    this.languages,
    required this.telCode,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String? svgImg;
  final String continent;
  final String? capital;
  final dynamic flagEmoji;
  final Currency? currency;
  final Language? languages;
  final String telCode;
  final String? slug;

  Country copyWith({
    String? url,
    String? name,
    String? native,
    String? svgImg,
    String? continent,
    String? capital,
    dynamic flagEmoji,
    Currency? currency,
    Language? languages,
    String? telCode,
    String? slug,
  }) =>
      Country(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        svgImg: svgImg ?? this.svgImg,
        continent: continent ?? this.continent,
        capital: capital ?? this.capital,
        flagEmoji: flagEmoji ?? this.flagEmoji,
        currency: currency ?? this.currency,
        languages: languages ?? this.languages,
        telCode: telCode ?? this.telCode,
        slug: slug ?? this.slug,
      );

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        svgImg: json["svg_img"],
        continent: json["continent"],
        capital: json["capital"],
        flagEmoji: json["flag_emoji"],
        currency: json["currency"],
        languages: json["languages"],
        telCode: json["tel_code"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "svg_img": svgImg,
        "continent": continent,
        "capital": capital,
        "flag_emoji": flagEmoji,
        "currency": currency,
        "languages": languages,
        "tel_code": telCode,
        "slug": slug,
      };
}
