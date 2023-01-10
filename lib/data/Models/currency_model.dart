// To parse this JSON data, do
//
//     final currency = currencyFromMap(jsonString);

import 'dart:convert';

class Currency {
  Currency({
    this.url,
    required this.name,
    this.native,
    required this.code,
    this.emoji,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String code;
  final dynamic emoji;
  final String? slug;

  Currency copyWith({
    String? url,
    String? name,
    String? native,
    String? code,
    dynamic emoji,
    String? slug,
  }) =>
      Currency(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        code: code ?? this.code,
        emoji: emoji ?? this.emoji,
        slug: slug ?? this.slug,
      );

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        code: json["code"],
        emoji: json["emoji"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "code": code,
        "emoji": emoji,
        "slug": slug,
      };
}
